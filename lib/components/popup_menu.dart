import 'package:flutter/material.dart';
import 'package:taks_daily_app/components/option_menu.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';

class MenuDialog extends StatefulWidget {
  const MenuDialog({
    required this.email,
    super.key,
  });
  final String email;

  @override
  _MenuDialogState createState() => _MenuDialogState();
}

class _MenuDialogState extends State<MenuDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;
  Color colorSelected = Colors.blue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation!,
      child: Dialog(
        insetPadding: padSy16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SingleChildScrollView(
          child: Padding(
            padding: padSy16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AssetsApp.logo.path,
                      height: 80,
                    ),
                    Text(
                      'Easy Clean',
                      style: TextStyleApp.h1.blue50.w600,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.gray200,
                        size: 26,
                      ),
                      onPressed: () {
                        autoRouterPop(context);
                      },
                    ),
                  ],
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.home_rounded,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Inicio',
                  onPressed: () {
                    autoRouterPop(context);
                  },
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.person,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Perfil',
                  onPressed: () {
                    autoRouterPop(context);
                    autoRouterPush(
                      context,
                      ProfileScreenRoute(email: widget.email),
                    );
                  },
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.inventory,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Mi inventario',
                  onPressed: () {
                    autoRouterPop(context);
                    autoRouterPush(
                      context,
                      const MyInventoryScreenRoute(),
                    );
                  },
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.turned_in_not_sharp,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Promociones',
                  onPressed: () {
                    autoRouterPop(context);
                    autoRouterPush(
                      context,
                      const PromotionsScreenRoute(),
                    );
                  },
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.tips_and_updates_rounded,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Consejos útiles',
                  onPressed: () {
                    autoRouterPop(context);
                    autoRouterPush(
                      context,
                      const TipsCleanScreenRoute(),
                    );
                  },
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.history_rounded,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Historial de tareas',
                  onPressed: () {
                    autoRouterPop(context);
                    autoRouterPush(
                      context,
                      const HistoryTaskScreenRoute(),
                    );
                  },
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.history_rounded,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Historial de códigos',
                  onPressed: () {
                    autoRouterPop(context);
                    autoRouterPush(
                      context,
                      const HistoryCodRedeemScreenRoute(),
                    );
                  },
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.settings,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Configuración',
                  onPressed: () {
                    autoRouterPop(context);
                    autoRouterPush(context, const ConfigurationScreenRoute());
                  },
                ),
                OptionMenu(
                  icon: const Icon(
                    Icons.exit_to_app_rounded,
                    color: AppColors.gray200,
                    applyTextScaling: true,
                    size: 26,
                  ),
                  title: 'Cerrar sesión',
                  onPressed: () {
                    autoRouterPushAndPopUntil(
                      context,
                      const AuthenticationScreenRoute(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
