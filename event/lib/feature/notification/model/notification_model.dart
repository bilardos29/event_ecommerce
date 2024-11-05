class NotificationModel {
  String? notifId;
  String? notifName;
  String? notifDetail;

  NotificationModel({
    this.notifId,
    this.notifName,
    this.notifDetail,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notifId = json['notification_id'];
    notifName = json['notification_name'];
    notifDetail = json['notification_detail'];
  }

}
