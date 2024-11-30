import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router.dart';

class CreatedTaskCompletedDialog extends StatefulWidget {
  const CreatedTaskCompletedDialog({
    required this.commentController,
    required this.imagePath,
    required this.onAccept,
    super.key,
  });
  final TextEditingController commentController;
  final Function(String) imagePath;
  final Function() onAccept;

  @override
  _CreatedTaskCompletedDialogState createState() =>
      _CreatedTaskCompletedDialogState();
}

class _CreatedTaskCompletedDialogState extends State<CreatedTaskCompletedDialog>
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
                Text(
                  '¿Seguro de terminar la tarea?',
                  style: TextStyleApp.h2.blue50.w500,
                ),
                gap8,
                const Text(
                  'Selecciona en el icono de camára para capturar'
                  ' evidencia de la tarea completada',
                  style: TextStyleApp.body,
                ),
                gap8,
                InputCommentCustom(
                  controller: widget.commentController,
                  label: '',
                  hint: 'Comentarios',
                ),
                gap16,
                if (_image == null)
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.gray50),
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: _showImageSourceDialog,
                        child: const Icon(
                          Icons.photo_camera_rounded,
                          size: 30,
                          color: AppColors.gray,
                        ),
                      ),
                    ),
                  )
                else
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
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
