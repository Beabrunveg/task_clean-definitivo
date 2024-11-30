import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/get_task_days_past_usecase.dart';

part 'history_task_provider.g.dart';

/// AutoDispose provider for the HistoryTaskNotifier.
@riverpod
class HistoryTaskNotifier extends _$HistoryTaskNotifier {
  @override
  AsyncValue<List<DailyTask>?> build() {
    fecthGetTaskPastDay();
    return const AsyncValue.loading();
  }

  Future<void> fecthGetTaskPastDay() async {
    state = const AsyncValue.loading();
    final result = await sl<GetTaskDaysPast>().execute();
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
