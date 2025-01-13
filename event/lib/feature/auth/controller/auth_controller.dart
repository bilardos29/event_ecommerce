import 'package:event/feature/auth/model/user_model.dart';
import 'package:event/utils/validation_utils.dart';
import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier{

  void forgotPassword(
    String email, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  }) {
    String err = Validation.validateEmail(email);
    if (err.isEmpty) {
      onSuccess!();
    } else {
      onError!(err);
    }
  }

  void login(
    String email,
    String password, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  }) {
    String err = Validation.validateEmail(email);
    if (err.isEmpty) {
      bool isFound = false;
      for(UserModel item in listUser) {
        if (email == item.email && password == item.password) {
          isFound = true;
          break;
        }
      }
      isFound ? onSuccess!() : onError!('Email not found!');
    } else {
      onError!(err);
    }
  }
}
