import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/get_task_for_day_usecase.dart';
import 'package:taks_daily_app/src/usecases/insert_task_day_usecase.dart';

part 'task_pending_provider.g.dart';

/// AutoDispose provider for the TaskPendingNotifier.
@riverpod
class TaskPendingNotifier extends _$TaskPendingNotifier {
  @override
  AsyncValue<List<DailyTask>?> build() {
    fecthGetTaskDay();
    onRegisterTaskDay();
    return const AsyncValue.loading();
  }

  /// Get the total of pending tasks.
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
        final filterTaskPending = r.where((e) => !e.isCompleted).toList();
        state = AsyncValue.data(filterTaskPending);
      },
    );
  }

  /// Get the total of pending tasks.
  int getTotalPendings() {
    final dailyTaks = state.value ?? [];
    return dailyTaks.length;
  }

  /// Register the day.
  Future<void> onRegisterTaskDay() async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );

    final result = await sl<InsertTaskDay>().execute(
      Daily(
        id: 0,
        day: '${DateTime.now().day}-${DateTime.now().month}-'
            '${DateTime.now().year}',
      ),
    );

    await result.match(
      (l) {
        log('Error al registrar la tarea');
      },
      (r) async {
        log('Dia registrado correctamente');
      },
    );
  }
}
