import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/presentation/home/providers/redeem_promo_provider.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/insert_task_usecase.dart';

part 'task_create_provider.g.dart';

/// AutoDispose provider for the TaskCreateNotifier.
@riverpod
class TaskCreateNotifier extends _$TaskCreateNotifier {
  @override
  AsyncValue<int?> build() {
    return const AsyncValue.loading();
  }

  /// Create task method.
  Future<void> fetchCreateTask(DailyTask dailyTask) async {
    state = const AsyncValue.loading();
    final result = await sl<InsertTask>().execute(dailyTask);
    result.match(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
      },
      (r) {
        ref.read(redeemPromoProvider.notifier).state = false;
        state = AsyncValue.data(r);
      },
    );
  }
}
