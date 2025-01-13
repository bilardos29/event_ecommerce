import 'package:event/feature/auth/model/user_category_model.dart';
import 'package:event/utils/validation_utils.dart';
import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier{

  UserCategoryModel userCat = listUserCat[0];

  void updateUserCat(UserCategoryModel item){
    userCat = item;
    notifyListeners();
  }

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