import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/presentation/home/providers/task_completed_provider.dart';
import 'package:taks_daily_app/presentation/home/providers/task_delete_provider.dart';
import 'package:taks_daily_app/presentation/home/providers/task_pending_provider.dart';
import 'package:taks_daily_app/presentation/home/providers/task_register_completed_provider.dart';
import 'package:taks_daily_app/presentation/home/widgets/widgets.dart';

/// List pending tasks widget.
class ListPending extends ConsumerStatefulWidget {
  const ListPending({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPendingState();
}

class _ListPendingState extends ConsumerState<ListPending> {
  final commentController = TextEditingController();
  String? imgPath;

  @override
  Widget build(BuildContext context) {
    ref.watch(taskPendingNotifierProvider.notifier);
    final state = ref.watch(taskPendingNotifierProvider);
    return state.when(
      data: (data) {
        final dailyTaks = data ?? [];
        if (dailyTaks.isEmpty) {
          return Center(
            child: Text(
              'No hay tareas pendientes',
              style: TextStyleApp.body.blue50.w500,
            ),
          );
        }
        return ListView.builder(
          padding: padSy16,
          itemCount: dailyTaks.length,
          itemBuilder: (context, index) {
            final task = dailyTaks[index];
            return CardPending(
              onDelete: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: padSy16,
                      child: AlertDialog(
                        title: const Text('Eliminar persona'),
                        content: const Text(
                          '¿Estás seguro de eliminar esta persona?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () async {
                              unawaited(
                                ProgressDialogo.showLoader(context),
                              );
                              await ref
                                  .read(
                                    taskDeleteNotifierProvider.notifier,
                                  )
                                  .fetchDeleteTaskData(
                                    task.id,
                                  );
                              await ref
                                  .read(
                                    taskPendingNotifierProvider.notifier,
                                  )
                                  .fecthGetTaskDay();
                              ProgressDialogo.dissmiss(context);
                            },
                            child: const Text('Aceptar'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              onTapCompleted: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CreatedTaskCompletedDialog(
                      commentController: commentController,
                      imagePath: (img) {
                        imgPath = img;
                      },
                      onAccept: () async {
                        if (commentController.text.isEmpty) {
                          toastWarning(
                            'Debes ingresar un comentario',
                          );
                          return;
                        }
                        if (imgPath == null) {
                          toastWarning(
                            'Debes seleccionar una imagen',
                          );
                          return;
                        }
                        unawaited(ProgressDialogo.showLoader(context));

                        await ref
                            .read(
                              taskRegisterCompletedNotifierProvider.notifier,
                            )
                            .onCompletedTask(
                              idTask: task.id,
                              isCompleted: true,
                              image: imgPath!,
                              comment: commentController.text,
                            );
                        await ref
                            .read(taskPendingNotifierProvider.notifier)
                            .fecthGetTaskDay();
                        await ref
                            .read(taskCompletedNotifierProvider.notifier)
                            .fecthGetTaskDay();
                        ProgressDialogo.dissmiss(context);
                        ProgressDialogo.dissmiss(context);
                      },
                    );
                  },
                );
              },
              taskTitle: task.taskName,
              date: task.date,
              name: task.personName,
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
