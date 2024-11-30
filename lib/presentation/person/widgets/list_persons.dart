import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/presentation/home/providers/task_pending_provider.dart';
import 'package:taks_daily_app/presentation/person/providers/person_delete_provider.dart';
import 'package:taks_daily_app/presentation/person/providers/persons_provider.dart';
import 'package:taks_daily_app/presentation/person/providers/task_create_provider.dart';
import 'package:taks_daily_app/presentation/person/widgets/widgets.dart';
import 'package:taks_daily_app/src/models/models.dart';

/// List persons widget.
class ListPersons extends ConsumerStatefulWidget {
  const ListPersons({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPersonsState();
}

class _ListPersonsState extends ConsumerState<ListPersons> {
  /// controlls for the textfields
  final controller = TextEditingController();
  final taskController = TextEditingController();
  final timeController = TextEditingController();
  final commentController = TextEditingController();
  String color = '';

  @override
  Widget build(BuildContext context) {
    /// Fetch the persons.
    ref.watch(personPersonsNotifierProvider.notifier);

    /// Get the state of the persons.
    final state = ref.watch(personPersonsNotifierProvider);

    return state.when(
      data: (data) {
        final persons = data ?? [];
        if (persons.isEmpty) {
          return Center(
            child: Text(
              'Registra una persona',
              style: TextStyleApp.body.blue50.w500,
            ),
          );
        }
        return Column(
          children: [
            Padding(
              padding: padSy26.copyWith(bottom: 0),
              child: const Text(
                'Registra una persona y luego selecciona'
                ' para poder registrar una tarea.',
                style: TextStyleApp.body,
              ),
            ),
            InputSearchCustom(
              controller: controller,
              label: '',
              hint: 'Buscar',
              onChanged: (value) {
                ref
                    .read(personPersonsNotifierProvider.notifier)
                    .searchPerson(value);
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: padSy16,
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  final person = persons[index];
                  return InkWell(
                    onTap: () {
                      /// Show the dialog to create a task.
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TaskDialog(
                            taskController: taskController,
                            timeController: timeController,
                            commentController: commentController,
                            onColorSelected: (colorSelected) {
                              color = colorSelected.value.toRadixString(16);
                            },
                            onAccept: () async {
                              if (taskController.text.isEmpty ||
                                  timeController.text.isEmpty ||
                                  commentController.text.isEmpty) {
                                toastWarning(
                                  'Por favor, complete todos los campos',
                                );
                                return;
                              }
                              final task = DailyTask(
                                personId: person.id ?? 0,
                                taskName: taskController.text,
                                taskDescription: commentController.text,
                                date: '${DateTime.now().day}-'
                                    '${DateTime.now().month}-'
                                    '${DateTime.now().year}',
                                id: 0,
                                isCompleted: false,
                                color: color == ''
                                    ? Colors.blue.value.toRadixString(16)
                                    : color,
                                personName: '',
                                hour: timeController.text,
                                comment: '',
                                image: '',
                              );
                              unawaited(
                                ProgressDialogo.showLoader(context),
                              );

                              /// Create a task.
                              await ref
                                  .read(taskCreateNotifierProvider.notifier)
                                  .fetchCreateTask(
                                    task,
                                  );
                              taskController.clear();
                              timeController.clear();
                              commentController.clear();
                              await ref
                                  .read(taskPendingNotifierProvider.notifier)
                                  .fecthGetTaskDay();
                              ProgressDialogo.dissmiss(context);
                              ProgressDialogo.dissmiss(context);
                              ProgressDialogo.dissmiss(context);
                            },
                            personData: person,
                          );
                        },
                      );
                    },
                    child: CardPerson(
                      name: person.name ?? '',
                      age: (person.age ?? '').toString(),
                      aviailability: person.availability ?? '',
                      pathImage: person.image ?? '',
                      onDelete: () {
                        /// Show the dialog to delete a person.
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
                                            personDeleteNotifierProvider
                                                .notifier,
                                          )
                                          .fetchDeletePersonData(
                                            person.id ?? 0,
                                          );
                                      await ref
                                          .read(
                                            personPersonsNotifierProvider
                                                .notifier,
                                          )
                                          .fetchGetAllPersons();
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
                    ),
                  );
                },
              ),
            ),
          ],
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
