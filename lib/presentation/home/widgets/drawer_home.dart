import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
/// DrawerHome is a StatelessWidget that shows the drawer of the home screen.
class DrawerHome extends StatelessWidget {
  const DrawerHome({
    required this.email,
    super.key,
  });

  final String email;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ColoredBox(
        color: AppColors.blue50.withOpacity(.1),
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.blue50,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.menu_open_rounded,
                          color: AppColors.white,
                          size: 30,
                        ),
                        space8,
                        Text(
                          'Menu',
                          style: TextStyleApp.h1Header.white.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {},
                      child: Image.asset(
                        AssetsApp.logoIcon.path,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => autoRouterPop(context),
              child: Container(
                padding: padSy16,
                margin: padSy16,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AssetsApp.menu.path,
                      width: 30,
                      height: 30,
                    ),
                    space8,
                    const Text(
                      'Tareas',
                      style: TextStyleApp.h2,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () =>
                  autoRouterPush(context, const ConfigurationScreenRoute()),
              child: Container(
                padding: padSy16,
                margin: padSy16,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsApp.settingSvg.path,
                      width: 26,
                      height: 26,
                    ),
                    space8,
                    const Text(
                      'Configuración',
                      style: TextStyleApp.h2,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: padSy16,
                child: ButtonTertiary(
                  onPressed: () async {
                    autoRouterPushAndPopUntil(
                      context,
                      const WelcomeScreenRoute(),
                    );
                  },
                  label: 'Cerrar sesión',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
