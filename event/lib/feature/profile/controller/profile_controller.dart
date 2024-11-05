import 'package:event/feature/profile/controller/profile_interface.dart';
import 'package:flutter/cupertino.dart';

class ProfileController extends ChangeNotifier implements ProfileInterface {

  @override
  void logout({VoidCallback? onSuccess}) {
    // TODO: implement logout
  }

  @override
  void updateImageProfile(String base64, {ValueChanged<String>? onError, VoidCallback? onSuccess}) {
    // TODO: implement updateImageProfile
  }

  @override
  void updateProfile() {
    // TODO: implement updateProfile
  }


}