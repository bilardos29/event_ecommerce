class AnnounceModel {
  int? id;
  String? title;
  String? date;
  String? image;

  AnnounceModel(
      {this.id, this.title, this.date, this.image});

  AnnounceModel.fromJson(Map<String, dynamic> json) {
    id = json['announce_id'];
    title = json['announce_title'];
    image = json['announce_image'];
    date = json['announce_date'];
  }
}

List<AnnounceModel> get listAnnounce => [
  AnnounceModel(id: 0, title:'Event Calendar', date: 'December 2024', image: 'img_announcement.jpeg'),
  AnnounceModel(id: 1, title:'Culture Communication for Business Success with Warren Rustand '
      '& Gina Mollicone-Long', date: '17 Februari 2025', image: 'img_announce_2.jpeg'),
  AnnounceModel(id: 2, title:'9D7N Mongolia', date: '29 May - 6 June 2025', image: 'img_announce_3.jpeg'),
  AnnounceModel(id: 2, title:'MyEO Junkie', date: '2024-2025', image: 'img_announce_4.jpeg'),
];