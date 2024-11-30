import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/insert_coupon_usecase.dart';

part 'coupon_register_provider.g.dart';

/// AutoDispose provider for the CouponRegisterNotifier.
@riverpod
class CouponRegisterNotifier extends _$CouponRegisterNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.loading();
  }

  /// Register coupon method.
  Future<void> onRegisterCoupon({
    required CouponData couponData,
  }) async {
    final result = await sl<InsertCoupon>().execute(
      couponData,
    );

    await result.match(
      (l) {
        log('Error al completar la tarea');
      },
      (r) async {
        toastSuccess('Cupón registrado');
      },
    );
  }
}
