import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router.dart';
import 'package:taks_daily_app/src/models/models.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({
    required this.taskController,
    required this.timeController,
    required this.commentController,
    required this.onColorSelected,
    required this.onAccept,
    required this.personData,
    super.key,
  });
  final TextEditingController taskController;
  final TextEditingController timeController;
  final TextEditingController commentController;
  final Function(Color) onColorSelected;
  final Function() onAccept;
  final PersonData personData;

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog>
    with SingleTickerProviderStateMixin {
  Color colorSelected = Colors.blue;
  AnimationController? _animationController;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation!,
      child: Dialog(
        insetPadding: padSy16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SingleChildScrollView(
          child: Padding(
            padding: padSy32.copyWith(
              bottom: 32,
              top: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.playlist_add_circle_outlined,
                  color: AppColors.blue50,
                  weight: 0.5,
                  size: 36,
                ),
                gap8,
                Text(
                  'Agregar tarea',
                  style: TextStyleApp.h2.blue50.w500,
                ),
                gap8,
                const Text(
                  'Persona asignada a la tarea',
                  textAlign: TextAlign.center,
                  style: TextStyleApp.body,
                ),
                gap8,
                Container(
                  height: 36,
                  padding: padSy8,
                  decoration: BoxDecoration(
                    color: AppColors.blue100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${widget.personData.name}',
                    style: TextStyleApp.body.blue50.w700,
                  ),
                ),
                const Divider(
                  height: 24,
                  color: AppColors.gray50,
                  thickness: 2,
                ),
                gap8,
                InputCustom(
                  controller: widget.taskController,
                  label: 'Tarea',
                  hint: 'Ingresa el nombre de la tarea',
                ),
                gap8,
                InputCustom(
                  controller: widget.timeController,
                  label: 'Hora límite',
                  hint: 'Ingresa la hora límite',
                  formatters: [
                    MaskTextInputFormatter(
                      mask: '##:##',
                      filter: {
                        '#': RegExp('[0-9]'),
                      },
                    ),
                  ],
                ),
                gap8,
                InputCustom(
                  controller: widget.commentController,
                  label: 'Comentario',
                  hint: 'Ingresa un comentario',
                ),
                gap8,
                Row(
                  children: [
                    const Text(
                      'Selecciona un color',
                      style: TextStyleApp.body,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        await showDialog(
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Selecciona un color',
                            ),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: colorSelected,
                                onColorChanged: (Color color) {
                                  colorSelected = color;
                                  widget.onColorSelected(colorSelected);
                                },
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text(
                                  'Seleccionar',
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          context: context,
                        );
                        setState(() {});
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: colorSelected,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
                gap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 36,
                        child: ButtonSecondary(
                          verticalPadding: 4,
                          onPressed: () {
                            autoRouterPop(context);
                          },
                          label: 'Cancelar',
                        ),
                      ),
                    ),
                    space16,
                    Expanded(
                      child: SizedBox(
                        height: 36,
                        child: ButtonPrimary(
                          verticalPadding: 4,
                          onPressed: widget.onAccept,
                          label: 'Aceptar',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
