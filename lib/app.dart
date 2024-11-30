import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/flavors.dart';
import 'package:taks_daily_app/presentation/changed_theme.dart';

final appRouter = AppRouter();

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(changedThemeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: F.title,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: getDarkTheme(),
      theme: getLightTheme(),
      locale: DevicePreview.locale(context),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      builder: (BuildContext context, Widget? child) =>
          DevicePreview.appBuilder(
        context,
        _flavorBanner(
          child: child!,
        ),
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.bottomEnd,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                letterSpacing: 1,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
