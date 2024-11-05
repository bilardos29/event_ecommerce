import 'package:event/feature/auth/controller/auth_interface.dart';
import 'package:event/feature/auth/model/user_model.dart';
import 'package:event/utils/validation_utils.dart';
import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier implements AuthInterface {

  @override
  void forgotPassword(
    String email, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  }) {
    // TODO: implement forgotPassword
    String err = Validation.validateEmail(email);
    if (err.isEmpty) {
      onSuccess!();
    } else {
      onError!(err);
    }
  }

  @override
  void login(
    String email,
    String password, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  }) {
    // TODO: implement login

    String err = Validation.validateEmail(email);
    if (err.isEmpty) {
      onSuccess!();
    } else {
      onError!(err);
    }
  }

  @override
  void register(
    String email,
    String firstname,
    String lastname,
    String password,
    String rePassword, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  }) {
    // TODO: implement register

    String err = Validation.validateEmail(email!);
    if (err.isEmpty) {
      onSuccess!();
    } else {
      onError!(err);
    }
  }
}
