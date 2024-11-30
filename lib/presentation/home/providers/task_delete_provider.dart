import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/usecases/delete_task_usecase.dart';

part 'task_delete_provider.g.dart';

/// AutoDispose provider for the TaskDeleteNotifier.
@riverpod
class TaskDeleteNotifier extends _$TaskDeleteNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.loading();
  }

  /// Delete task method.
  Future<void> fetchDeleteTaskData(int id) async {
    state = const AsyncValue.loading();
    final result = await sl<DeleteTask>().execute(id);
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
