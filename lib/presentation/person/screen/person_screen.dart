import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/presentation/person/providers/person_create_provider.dart';
import 'package:taks_daily_app/presentation/person/providers/persons_provider.dart';
import 'package:taks_daily_app/presentation/person/widgets/list_persons.dart';
import 'package:taks_daily_app/src/models/person_data.dart';

/// Person Screen widget.
@RoutePage()
class PersonScreen extends ConsumerStatefulWidget {
  const PersonScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PersonScreenState();
}

class _PersonScreenState extends ConsumerState<PersonScreen> {
  /// controlls for the textfields
  final nameController = TextEditingController();
  final aviabilityController = TextEditingController();
  final ageController = TextEditingController();
  String color = '';
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personas',
          style: Theme.of(context).textTheme.displaySmall!.w500,
        ),
      ),
      body: const ListPersons(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            /// Show the dialog to create a person.
            return CreatedPersonDialog(
              nameController: nameController,
              avialityController: aviabilityController,
              ageController: ageController,
              color: (c) {
                color = c.value.toRadixString(16);
              },
              imagePath: (imgPath) {
                imagePath = imgPath;
              },
              onAccept: () async {
                if (nameController.text.isEmpty ||
                    aviabilityController.text.isEmpty ||
                    ageController.text.isEmpty ||
                    imagePath.isEmpty) {
                  toastWarning('Por favor, complete todos los campos');
                  return;
                }

                /// Create a person.
                final data = PersonData(
                  name: nameController.text,
                  availability: aviabilityController.text,
                  age: int.parse(ageController.text),
                  color:
                      color == '' ? Colors.blue.value.toRadixString(16) : color,
                  image: imagePath,
                );
                unawaited(
                  ProgressDialogo.showLoader(context),
                );

                /// Create a person.
                await ref
                    .read(personCreateNotifierProvider.notifier)
                    .fetchCreatePersonData(data);
                nameController.clear();
                aviabilityController.clear();
                ageController.clear();
                imagePath = '';
                color = '';
                ProgressDialogo.dissmiss(context);
                ProgressDialogo.dissmiss(context);
                await ref
                    .read(personPersonsNotifierProvider.notifier)
                    .fetchGetAllPersons();
              },
            );
          },
        ),
        child: const Icon(
          Icons.add_rounded,
          size: 32,
        ),
      ),
    );
  }
}
