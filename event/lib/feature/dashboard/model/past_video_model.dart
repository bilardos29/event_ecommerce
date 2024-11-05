class PastVideoModel {
  String? link;

  PastVideoModel({
    this.link,
  });

  PastVideoModel.fromJson(Map<String, dynamic> json) {
    link = json['link'];
  }
}
