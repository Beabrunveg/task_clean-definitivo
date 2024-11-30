import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/get_list_coupons_usecase.dart';

part 'history_cod_redeem_provider.g.dart';

/// AutoDispose provider implementation for the HistoryCodRedeemNotifier.
@riverpod
class HistoryCodRedeemNotifier extends _$HistoryCodRedeemNotifier {
  @override
  AsyncValue<List<CouponData>?> build() {
    fecthGetCoupons();
    return const AsyncValue.loading();
  }

  Future<void> fecthGetCoupons() async {
    state = const AsyncValue.loading();
    final result = await sl<GetListCoupons>().execute();
    result.match(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
      },
      (r) {
        state = AsyncValue.data(r);
      },
    );
  }
}
