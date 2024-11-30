import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router.dart';

class CreatedPersonDialog extends StatefulWidget {
  const CreatedPersonDialog({
    required this.nameController,
    required this.avialityController,
    required this.ageController,
    required this.imagePath,
    required this.color,
    required this.onAccept,
    super.key,
  });
  final TextEditingController nameController;
  final TextEditingController avialityController;
  final TextEditingController ageController;
  final Function(String) imagePath;
  final Function(Color) color;
  final Function() onAccept;

  @override
  _CreatedPersonDialogState createState() => _CreatedPersonDialogState();
}

class _CreatedPersonDialogState extends State<CreatedPersonDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;
  Color colorSelected = Colors.blue;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = pickedFile;
          widget.imagePath(pickedFile.path);
        });
      }
    } catch (e) {
      log('Error al seleccionar imagen: $e');
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccionar imagen'),
          content: const Text('Elige una opción para seleccionar una imagen'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
              child: const Text('Galería'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
              child: const Text('Cámara'),
            ),
          ],
        );
      },
    );
  }

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

  void _clearImage() {
    setState(() {
      _image = null;
    });
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
            padding: padSy32,
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
                  'Agregar Persona',
                  style: TextStyleApp.h2.blue50.w500,
                ),
                gap8,
                Text(
                  'Ingresa los datos de la persona ó familiar',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.w500,
                ),
                const Divider(
                  height: 16,
                  color: AppColors.gray50,
                  thickness: 2,
                ),
                gap8,
                InputCustom(
                  controller: widget.nameController,
                  label: 'Nombre',
                  hint: 'Ingresa el nombre de la persona',
                ),
                gap8,
                InputCustom(
                  controller: widget.avialityController,
                  label: 'Disponibilidad',
                  hint: 'Ingresa la disponibilidad',
                ),
                gap8,
                InputCustom(
                  controller: widget.ageController,
                  label: 'Edad',
                  hint: 'Ingresa la edad',
                ),
                gap8,
                Row(
                  children: [
                    Text(
                      'Selecciona un color',
                      style: Theme.of(context).textTheme.displaySmall!.w500,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        await showDialog(
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Selecciona un color',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .w500,
                            ),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: colorSelected,
                                onColorChanged: (Color color) {
                                  colorSelected = color;
                                  widget.color(color);
                                },
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: Text(
                                  'Seleccionar',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .w500,
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
                if (_image == null)
                  SizedBox(
                    height: 36,
                    child: ElevatedButton(
                      onPressed: _showImageSourceDialog,
                      child: Text(
                        'Seleccionar Foto',
                        style: Theme.of(context).textTheme.displaySmall!.w500,
                      ),
                    ),
                  )
                else
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_image!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Row(
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.delete, color: Colors.white),
                              onPressed: _clearImage,
                            ),
                          ],
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
