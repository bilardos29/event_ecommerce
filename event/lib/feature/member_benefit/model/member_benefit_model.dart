class MemberBenefitModel {
  String? title;
  String? detail;
  String? location;
  String? banner;
  String? category;

  MemberBenefitModel({
    this.title,
    this.detail,
    this.location,
    this.banner,
    this.category,
  });

  MemberBenefitModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    detail = json['detail'];
    location = json['location'];
    banner = json['banner'];
    category = json['category'];
  }
}

List<MemberBenefitModel> get listMemberBenefit => [
      MemberBenefitModel(
        title: 'Cloud Lounge Jakarta (Rooftop)',
        detail: '',
        location: 'Jakarta',
        banner: 'img_partner_1.jpg',
        category: 'Cafe & Bar',
      ),
      MemberBenefitModel(
        title: 'HEALTHY LIFE CLINIC',
        detail: '',
        location: 'Jakarta',
        banner: 'img_partner_2.jpg',
        category: 'Health',
      ),
      MemberBenefitModel(
        title: 'Pondok Indah Padang Golf',
        detail: '',
        location: 'Jakarta',
        banner: 'img_partner_3.jpeg',
        category: 'Golf',
      ),
      MemberBenefitModel(
        title: 'Damai Indah PIK Golf',
        detail: '',
        location: 'Jakarta',
        banner: 'img_partner_4.jpeg',
        category: 'Golf',
      ),
      MemberBenefitModel(
        title: 'The Ritz Carlton',
        detail: '',
        location: 'Jakarta',
        banner: 'img_partner_5.jpg',
        category: 'Hotel',
      ),
      MemberBenefitModel(
        title: 'Grand Hyatt Jakarta',
        detail: '',
        location: 'Jakarta',
        banner: 'img_partner_6.jpg',
        category: 'Hotel',
      ),
    ];
