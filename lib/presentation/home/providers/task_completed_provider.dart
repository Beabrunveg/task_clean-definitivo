import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/daily_task.dart';
import 'package:taks_daily_app/src/usecases/get_task_for_day_usecase.dart';

part 'task_completed_provider.g.dart';
/// AutoDispose provider for the TaskCompletedNotifier.
@riverpod
class TaskCompletedNotifier extends _$TaskCompletedNotifier {
  @override
  AsyncValue<List<DailyTask>?> build() {
    fecthGetTaskDay();
    return const AsyncValue.loading();
  }

  /// Get the total of completed tasks.
  int getTotalCmpleted() {
    final dailyTaks = state.value ?? [];
    return dailyTaks.length;
  }
  /// Get the total of completed tasks.
  Future<void> fecthGetTaskDay() async {
    state = const AsyncValue.loading();
    final result = await sl<GetTasksForDay>().execute(
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
    );
    result.match(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
      },
      (r) {
        final filterTaskCompleted = r.where((e) => e.isCompleted).toList();
        state = AsyncValue.data(filterTaskCompleted);
      },
    );
  }
}
