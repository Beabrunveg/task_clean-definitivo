import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/presentation/changed_theme.dart';
/// Screen to configure the app.
@RoutePage()
class ConfigurationScreen extends ConsumerWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(changedThemeProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blue50),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => autoRouterPop(context),
            );
          },
        ),
        centerTitle: false,
        title: Text(
          'Configuración',
          style: Theme.of(context).textTheme.headlineSmall!.w500,
        ),
      ),
      body: Padding(
        padding: padSy16,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark mode',
                  style: Theme.of(context).textTheme.bodyMedium!.w500,
                ),
                Switch(
                  value: isDarkMode,
                  activeColor: AppColors.green,
                  onChanged: (value) {
                    ref.read(changedThemeProvider.notifier).toggleTheme();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notificaciones',
                  style: Theme.of(context).textTheme.bodyMedium!.w500,
                ),
                Switch(
                  value: false,
                  activeColor: AppColors.green,
                  onChanged: (value) {},
                ),
              ],
            ),
            gap16,
          ],
        ),
      ),
    );
  }
}
