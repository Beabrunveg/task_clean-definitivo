// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:taks_daily_app/presentation/authentication/screen/authentication_screen.dart'
    as _i2;
import 'package:taks_daily_app/presentation/configuration/screen/configuration_screen.dart'
    as _i3;
import 'package:taks_daily_app/presentation/history_cod_redeem/screen/history_cod_redeem_screen.dart'
    as _i4;
import 'package:taks_daily_app/presentation/history_task/screen/history_task_screen.dart'
    as _i5;
import 'package:taks_daily_app/presentation/home/screen/home_screen.dart'
    as _i6;
import 'package:taks_daily_app/presentation/my_inventory/screen/add_inventory_screen.dart'
    as _i1;
import 'package:taks_daily_app/presentation/my_inventory/screen/my_inventory_screen.dart'
    as _i7;
import 'package:taks_daily_app/presentation/person/screen/person_screen.dart'
    as _i8;
import 'package:taks_daily_app/presentation/photo_completer/screen/photo_completer_screen.dart'
    as _i9;
import 'package:taks_daily_app/presentation/profile/screen/profile_screen.dart'
    as _i10;
import 'package:taks_daily_app/presentation/promotions/screen/promotions_screen.dart'
    as _i11;
import 'package:taks_daily_app/presentation/register/screen/register_screen.dart'
    as _i12;
import 'package:taks_daily_app/presentation/splash/splash_screen.dart' as _i13;
import 'package:taks_daily_app/presentation/tips_clean/screen/tips_clean_screen.dart'
    as _i14;
import 'package:taks_daily_app/presentation/welcome/screen/welcome_screen.dart'
    as _i15;

/// generated route for
/// [_i1.AddInventoryScreen]
class AddInventoryScreenRoute
    extends _i16.PageRouteInfo<AddInventoryScreenRouteArgs> {
  AddInventoryScreenRoute({
    required dynamic Function(
      String,
      String,
    ) onPressedSaved,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          AddInventoryScreenRoute.name,
          args: AddInventoryScreenRouteArgs(
            onPressedSaved: onPressedSaved,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddInventoryScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddInventoryScreenRouteArgs>();
      return _i1.AddInventoryScreen(
        onPressedSaved: args.onPressedSaved,
        key: args.key,
      );
    },
  );
}

class AddInventoryScreenRouteArgs {
  const AddInventoryScreenRouteArgs({
    required this.onPressedSaved,
    this.key,
  });

  final dynamic Function(
    String,
    String,
  ) onPressedSaved;

  final _i17.Key? key;

  @override
  String toString() {
    return 'AddInventoryScreenRouteArgs{onPressedSaved: $onPressedSaved, key: $key}';
  }
}

/// generated route for
/// [_i2.AuthenticationScreen]
class AuthenticationScreenRoute extends _i16.PageRouteInfo<void> {
  const AuthenticationScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AuthenticationScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthenticationScreen();
    },
  );
}

/// generated route for
/// [_i3.ConfigurationScreen]
class ConfigurationScreenRoute extends _i16.PageRouteInfo<void> {
  const ConfigurationScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ConfigurationScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfigurationScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.ConfigurationScreen();
    },
  );
}

/// generated route for
/// [_i4.HistoryCodRedeemScreen]
class HistoryCodRedeemScreenRoute extends _i16.PageRouteInfo<void> {
  const HistoryCodRedeemScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HistoryCodRedeemScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryCodRedeemScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.HistoryCodRedeemScreen();
    },
  );
}

/// generated route for
/// [_i5.HistoryTaskScreen]
class HistoryTaskScreenRoute extends _i16.PageRouteInfo<void> {
  const HistoryTaskScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HistoryTaskScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryTaskScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.HistoryTaskScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreenRoute extends _i16.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    required String email,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeScreenRouteArgs>();
      return _i6.HomeScreen(
        email: args.email,
        key: args.key,
      );
    },
  );
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i17.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i7.MyInventoryScreen]
class MyInventoryScreenRoute extends _i16.PageRouteInfo<void> {
  const MyInventoryScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MyInventoryScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyInventoryScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.MyInventoryScreen();
    },
  );
}

/// generated route for
/// [_i8.PersonScreen]
class PersonScreenRoute extends _i16.PageRouteInfo<void> {
  const PersonScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PersonScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.PersonScreen();
    },
  );
}

/// generated route for
/// [_i9.PhotoCompleterScreen]
class PhotoCompleterScreenRoute
    extends _i16.PageRouteInfo<PhotoCompleterScreenRouteArgs> {
  PhotoCompleterScreenRoute({
    required int idTask,
    required bool isCompleted,
    required dynamic Function(String) onPressed,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          PhotoCompleterScreenRoute.name,
          args: PhotoCompleterScreenRouteArgs(
            idTask: idTask,
            isCompleted: isCompleted,
            onPressed: onPressed,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoCompleterScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhotoCompleterScreenRouteArgs>();
      return _i9.PhotoCompleterScreen(
        idTask: args.idTask,
        isCompleted: args.isCompleted,
        onPressed: args.onPressed,
        key: args.key,
      );
    },
  );
}

class PhotoCompleterScreenRouteArgs {
  const PhotoCompleterScreenRouteArgs({
    required this.idTask,
    required this.isCompleted,
    required this.onPressed,
    this.key,
  });

  final int idTask;

  final bool isCompleted;

  final dynamic Function(String) onPressed;

  final _i17.Key? key;

  @override
  String toString() {
    return 'PhotoCompleterScreenRouteArgs{idTask: $idTask, isCompleted: $isCompleted, onPressed: $onPressed, key: $key}';
  }
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileScreenRoute extends _i16.PageRouteInfo<ProfileScreenRouteArgs> {
  ProfileScreenRoute({
    required String email,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ProfileScreenRoute.name,
          args: ProfileScreenRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileScreenRouteArgs>();
      return _i10.ProfileScreen(
        email: args.email,
        key: args.key,
      );
    },
  );
}

class ProfileScreenRouteArgs {
  const ProfileScreenRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ProfileScreenRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i11.PromotionsScreen]
class PromotionsScreenRoute extends _i16.PageRouteInfo<void> {
  const PromotionsScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PromotionsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionsScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.PromotionsScreen();
    },
  );
}

/// generated route for
/// [_i12.RegisterScreen]
class RegisterScreenRoute extends _i16.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegisterScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i13.SplashScreen]
class SplashScreenRoute extends _i16.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.SplashScreen();
    },
  );
}

/// generated route for
/// [_i14.TipsCleanScreen]
class TipsCleanScreenRoute extends _i16.PageRouteInfo<void> {
  const TipsCleanScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          TipsCleanScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'TipsCleanScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.TipsCleanScreen();
    },
  );
}

/// generated route for
/// [_i15.WelcomeScreen]
class WelcomeScreenRoute extends _i16.PageRouteInfo<void> {
  const WelcomeScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WelcomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeScreenRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.WelcomeScreen();
    },
  );
}
