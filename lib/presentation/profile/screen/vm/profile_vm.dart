import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/user.dart';
import 'package:taks_daily_app/src/usecases/get_user_by_email_usecase.dart';
import 'package:taks_daily_app/src/usecases/usecases.dart';

enum StatusProfile {
  loading,
  loaded,
  error,
}

/// ViewModel for the Profile screen.
class ProfileVm extends ChangeNotifier {
  ProfileVm(this.email) {
    email = email;
    initState();
  }
  String email;
  Future<void> initState() async {
    status = StatusProfile.loading;

    /// Get user information.
    await getUserInformation();
    status = StatusProfile.loaded;
  }

  User? user;

  StatusProfile _status = StatusProfile.loading;
  set status(StatusProfile value) {
    _status = value;
    notifyListeners();
  }

  StatusProfile get status => _status;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  /// Get user information method.
  Future<void> getUserInformation() async {
    final result = await sl<GetUserByEmail>().execute(email);
    result.match(
      (l) {
        user = null;
      },
      (r) {
        user = r;
        nameController.text = user?.name ?? '';
        emailController.text = user?.email ?? '';
        phoneController.text = user?.phone ?? '';
        passwordController.text = user?.password ?? '';
      },
    );
  }

  /// Update user method.
  Future<void> onUpdatedUser() async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );
    final result = await sl<UpdateUser>().execute(
      User(
        id: user?.id ?? 0,
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        image: profileImage?.path ?? '',
      ),
    );

    result.match(
      (l) {
        toastDanger('Error al actualizar usuario');
        status = StatusProfile.error;
      },
      (r) {
        toastSuccess('Usuario actualizado correctamente');
        status = StatusProfile.loaded;
      },
    );
  }

  File? _profileImage;

  File? get profileImage => _profileImage;

  final ImagePicker _picker = ImagePicker();

  /// Update profile image method.
  Future<void> updateProfileImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }
}
