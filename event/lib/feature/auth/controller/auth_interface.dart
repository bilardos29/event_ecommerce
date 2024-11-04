import 'package:event/feature/auth/model/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthInterface {

  void login(String email, String password, {VoidCallback? onSuccess});
  void register(UserModel user, {VoidCallback? onSuccess});
  void forgotPassword(String email, {VoidCallback? onSuccess});
}