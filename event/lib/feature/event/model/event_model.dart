class EventModel {
  String? title;
  String? detail;
  String? dateStart;
  String? dateEnd;
  String? location;
  int? categoryId;
  int? interestGroupId;
  int? quota;
  String? video;
  String? banner;
  String? documentLink;

  EventModel({
    this.title,
    this.detail,
    this.dateStart,
    this.dateEnd,
    this.location,
    this.categoryId,
    this.interestGroupId,
    this.quota,
    this.video,
    this.banner,
    this.documentLink,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    detail = json['detail'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    location = json['location'];
    categoryId = json['category_id'];
    interestGroupId = json['interest_group_id'];
    quota = json['quota'];
    video = json['video'];
    banner = json['banner'];
    documentLink = json['document_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['detail'] = detail;
    data['date_start'] = dateStart;
    data['date_end'] = dateEnd;
    data['location'] = location;
    data['category_id'] = categoryId;
    data['interest_group_id'] = interestGroupId;
    data['quota'] = quota;
    data['video'] = video;
    data['banner'] = banner;
    data['document_link'] = documentLink;
    return data;
  }
}

List<EventModel> get listEvent => [
      EventModel(
          title: 'The Haunting Of The Seven Seas',
          detail: '',
          dateStart: '16 November 2024',
          dateEnd: '16 November 2024',
          location: 'Jakarta',
          categoryId: 1,
          quota: 100,
          banner: 'img_engagement.jpeg'),
      EventModel(
        title: 'Transform Marketing & Sales',
        detail: '',
        dateStart: '07 November 2024',
        dateEnd: '07 November 2024',
        location: 'Jakarta',
        categoryId: 0,
        quota: 100,
        banner: 'img_learning.jpeg',
      ),
      EventModel(
        title: 'Let\'s Talk About Anger',
        detail: '',
        dateStart: '21 Januari 2025',
        dateEnd: '21 Januari 2025',
        location: 'Jakarta',
        categoryId: 2,
        interestGroupId: 5,
        quota: 100,
        banner: 'img_myeo.jpeg',
      ),
      EventModel(
        title: 'Animal Awareness',
        detail: '',
        dateStart: '23 November 2024',
        dateEnd: '23 November 2024',
        location: 'Jakarta',
        categoryId: 6,
        quota: 100,
        banner: 'img_myeo_2.jpeg',
      ),
    ];
