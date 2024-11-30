import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/insert_user_usecase.dart';
/// ViewModel for the Register screen.
class RegisterVm extends ChangeNotifier {
  RegisterVm();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  /// Register user method.
  Future<void> registerUser(BuildContext context) async {
    final result = await sl<InsertUser>().execute(
      User(
        id: 0,
        email: emailController.text,
        password: passwordController.text,
        name: '',
        phone: '',
        image: '',
      ),
    );

    result.match(
      (l) {
        /// Show error message.
        autoRouterPop(context);
        toastDanger('Error al registrar usuario');
      },
      (r) {
        /// Show success message and navigate to the authentication screen.
        toastSuccess('Usuario registrado correctamente');
        autoRouterPush(context, const AuthenticationScreenRoute());
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
