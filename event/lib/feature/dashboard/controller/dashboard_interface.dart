import 'package:flutter/cupertino.dart';

abstract class DashboardInterface {
  void getPastVideo({
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  });

  void getBanner({
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  });

  void getProfile(String email, {
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  });

  void getNotification({
    ValueChanged<String>? onError,
    VoidCallback? onSuccess,
  });
}
