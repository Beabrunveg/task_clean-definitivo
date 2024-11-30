part of 'router_provider.dart';

/// AutoRouter configuration for the app.
@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  /// Default constructor for the AppRouter.
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      );

  /// List of routes for the app.
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashScreenRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: WelcomeScreenRoute.page,
        ),
        AutoRoute(
          page: RegisterScreenRoute.page,
        ),
        AutoRoute(
          page: AuthenticationScreenRoute.page,
        ),
        AutoRoute(
          page: HomeScreenRoute.page,
        ),
        AutoRoute(
          page: ProfileScreenRoute.page,
        ),
        AutoRoute(
          page: ConfigurationScreenRoute.page,
        ),
        AutoRoute(
          page: PhotoCompleterScreenRoute.page,
        ),
        AutoRoute(
          page: MyInventoryScreenRoute.page,
        ),
        AutoRoute(page: AddInventoryScreenRoute.page),
        AutoRoute(page: PersonScreenRoute.page),
        AutoRoute(page: PromotionsScreenRoute.page),
        AutoRoute(page: HistoryCodRedeemScreenRoute.page),
        AutoRoute(page: HistoryTaskScreenRoute.page),
        AutoRoute(page: HistoryTaskScreenRoute.page),
        AutoRoute(page: TipsCleanScreenRoute.page),
      ];
}
