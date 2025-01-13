import 'package:event/feature/dashboard/controller/dashboard_interface.dart';
import 'package:event/feature/dashboard/model/banner_model.dart';
import 'package:event/feature/dashboard/model/past_video_model.dart';
import 'package:event/feature/notification/model/notification_model.dart';
import 'package:event/feature/profile/model/profile_model.dart';
import 'package:flutter/cupertino.dart';

class DashboardController extends ChangeNotifier implements DashboardInterface {
  List<PastVideoModel> listVideo = [];
  List<BannerModel> listBanner = [
    BannerModel(link: 'images_1.jpg'),
    BannerModel(link: 'images_2.jpg'),
    BannerModel(link: 'images_3.jpg'),
    BannerModel(link: 'images_4.jpg'),
  ];
  List<NotificationModel> listNotification = [];
  ProfileModel? user;

  int page = 0;
  void changePage(int page){
    this.page = page;
    notifyListeners();
  }

  void logout(){
    page = 0;
    user = ProfileModel();
    notifyListeners();
  }

  @override
  void getBanner({ValueChanged<String>? onError, VoidCallback? onSuccess}) {
    // TODO: implement getBanner

    onSuccess!();
  }

  @override
  void getNotification(
      {ValueChanged<String>? onError, VoidCallback? onSuccess}) {
    // TODO: implement getNotification

    onSuccess!();
  }

  @override
  void getPastVideo({ValueChanged<String>? onError, VoidCallback? onSuccess}) {
    // TODO: implement getPastVideo

    onSuccess!();
  }

  @override
  void getProfile(String email, {ValueChanged<String>? onError, VoidCallback? onSuccess}) {
    // TODO: implement getProfile

    for(ProfileModel item in listProfile){
      if(item.email == email){
        user = item;
      }
    }

    notifyListeners();
    onSuccess!();
  }
}
