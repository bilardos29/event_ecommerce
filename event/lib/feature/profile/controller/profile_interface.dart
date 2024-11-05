import 'package:flutter/cupertino.dart';

abstract class ProfileInterface {

  void updateProfile();

  void updateImageProfile(
    String base64, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  });

  void logout({VoidCallback? onSuccess});
}
