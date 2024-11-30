import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/usecases/update_task_completion_usecase.dart';

part 'task_register_completed_provider.g.dart';

/// AutoDispose provider for the TaskRegisterCompletedNotifier.
@riverpod
class TaskRegisterCompletedNotifier extends _$TaskRegisterCompletedNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.loading();
  }

  /// Register completed task method.
  Future<void> onCompletedTask({
    required int idTask,
    required bool isCompleted,
    required String image,
    required String comment,
  }) async {
    final result = await sl<UpdateTaskCompletion>().execute(
      idTask,
      isCompleted,
      image,
      comment,
    );

    await result.match(
      (l) {
        log('Error al completar la tarea');
      },
      (r) async {
        toastSuccess('Tarea completada');
      },
    );
  }
}
