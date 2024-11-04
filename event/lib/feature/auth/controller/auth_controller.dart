import 'package:event/feature/auth/controller/auth_interface.dart';
import 'package:event/feature/auth/model/user_model.dart';
import 'package:event/utils/validation_utils.dart';
import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier implements AuthInterface{

  bool showErrorMessage = false;
  String errMessage = '';


  @override
  void forgotPassword(String email, {VoidCallback? onSuccess}) {
    // TODO: implement forgotPassword
    errMessage = Validation.validateEmail(email);
    if(errMessage.isEmpty){
      onSuccess!();
    } else {
      showErrorMessage = true;
      notifyListeners();
    }
  }

  @override
  void login(String email, String password, {VoidCallback? onSuccess}) {
    // TODO: implement login

    errMessage = Validation.validateEmail(email);
    if(errMessage.isEmpty){
      onSuccess!();
    } else {
      showErrorMessage = true;
      notifyListeners();
    }
  }

  @override
  void register(UserModel user, {VoidCallback? onSuccess}) {
    // TODO: implement register

    errMessage = Validation.validateEmail(user.email!);
    if(errMessage.isEmpty) {
      onSuccess!();
    } else {
      showErrorMessage = true;
      notifyListeners();
    }
  }

}