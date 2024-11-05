import 'package:event/feature/auth/model/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthInterface {
  void login(
    String email,
    String password, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  });

  void register(
    String email,
    String firstname,
    String lastname,
    String password,
    String rePassword, {
    VoidCallback? onSuccess,
  });

  void forgotPassword(
    String email, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  });
}
