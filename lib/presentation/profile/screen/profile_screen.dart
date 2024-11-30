import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/presentation/profile/profile.dart';

/// Profile Screen widget.
@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    required this.email,
    super.key,
  });
  final String email;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<ProfileVm>(
        create: (BuildContext screenContext) => ProfileVm(email),
        child: Consumer<ProfileVm>(
          builder: (_, ProfileVm viewModel, __) => Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.blue50),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => autoRouterPop(context),
                  );
                },
              ),
              centerTitle: false,
              title: Text('Mi perfil', style: TextStyleApp.h1.black),
            ),
            body: _buildBody(context, viewModel),
          ),
        ),
      );

  /// Build the body of the screen.
  Widget _buildBody(BuildContext context, ProfileVm viewModel) {
    switch (viewModel.status) {
      case StatusProfile.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case StatusProfile.loaded:
        return Padding(
          padding: padSy16,
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: _buildProfile(viewModel) as ImageProvider,
              ),
              gap16,
              TextButton(
                onPressed: () {
                  /// Show the dialog to select an image.
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Seleccionar imagen'),
                        content: const Text(
                          'Elige una opción para seleccionar una imagen',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              viewModel.updateProfileImage(ImageSource.gallery);
                            },
                            child: const Text('Galería'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              viewModel.updateProfileImage(ImageSource.camera);
                            },
                            child: const Text('Cámara'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Cambiar imagen',
                  style: TextStyleApp.body.blue50.w700,
                ),
              ),
              gap16,
              InputCustom(
                controller: viewModel.nameController,
                label: 'Nombre',
                hint: 'Ingresa tu nombre.',
              ),
              gap8,
              InputCustom(
                controller: viewModel.passwordController,
                label: 'Contraseña',
                hint: 'Ingresa tu contraseña.',
                obscureText: true,
              ),
              gap8,
              InputCustom(
                controller: viewModel.phoneController,
                label: 'Teléfono',
                hint: 'Ingresa tu teléfono.',
              ),
              const Spacer(),
              ButtonPrimary(
                onPressed: () async {
                  /// Update the user.
                  unawaited(ProgressDialogo.showLoader(context));
                  await viewModel.onUpdatedUser().then((_) async {
                    ProgressDialogo.dissmiss(context);
                  });
                },
                label: 'Editar',
              ),
            ],
          ),
        );
      case StatusProfile.error:
        return const Center(
          child: Text('Error al cargar la información'),
        );
    }
  }

  /// Build the profile image.
  dynamic _buildProfile(ProfileVm viewModel) {
    if (viewModel.user?.image != null && viewModel.user?.image == '') {
      return FileImage(File(viewModel.user!.image));
    }

    if (viewModel.profileImage != null) {
      return FileImage(File(viewModel.profileImage!.path));
    }

    return AssetImage(AssetsApp.avatar.path);
  }
}
