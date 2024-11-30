import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/presentation/home/providers/task_completed_provider.dart';
import 'package:taks_daily_app/presentation/home/widgets/widgets.dart';

/// List completed tasks.
class ListCompleted extends ConsumerWidget {
  const ListCompleted({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(taskCompletedNotifierProvider.notifier);
    final state = ref.watch(taskCompletedNotifierProvider);
    return state.when(
      data: (data) {
        final dailyTaks = data ?? [];
        if (dailyTaks.isEmpty) {
          return Center(
            child: Text(
              'No hay tareas completadas',
              style: TextStyleApp.body.blue50.w500,
            ),
          );
        }
        return ListView.builder(
          padding: padSy16,
          itemCount: dailyTaks.length,
          itemBuilder: (context, index) {
            final task = dailyTaks[index];
            return CardCompleted(
              taskTitle: task.taskName,
              name: task.personName,
              comment: task.comment,
              date: task.date,
              pathImage: task.image,
              color: Color(
                int.parse(
                  '0x${(task.color == '' ? Colors.blue.value.toRadixString(16) : task.color).toUpperCase()}',
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            'Error: $error',
            style: TextStyleApp.body.red.w500,
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
