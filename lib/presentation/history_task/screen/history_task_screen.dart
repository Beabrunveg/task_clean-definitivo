import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/presentation/history_task/widgets/widgets.dart';

/// Screen to show the history of the tasks.
@RoutePage()
class HistoryTaskScreen extends ConsumerWidget {
  const HistoryTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historial de tareas',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: const HistoryListTask(),
    );
  }
}
