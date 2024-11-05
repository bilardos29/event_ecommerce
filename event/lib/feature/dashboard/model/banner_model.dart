class BannerModel {
  String? link;

  BannerModel({
    this.link,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    link = json['link'];
  }
}