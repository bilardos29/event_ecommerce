class SAPModel {
  String? company;
  String? location;
  String? picName;
  String? picPosition;
  String? email;
  String? phone;
  String? category;
  String? userImage;
  String? services;

  SAPModel({
    this.company,
    this.location,
    this.picName,
    this.picPosition,
    this.email,
    this.phone,
    this.category,
    this.userImage,
    this.services,
  });

  SAPModel.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    location = json['location'];
    picName = json['pic_name'];
    picPosition = json['pic_position'];
    email = json['email'];
    phone = json['phone'];
    category = json['category'];
    userImage = json['user_image'];
    services = json['services'];
  }
}

List<SAPModel> get listSAP => [
      SAPModel(
        company: 'Charles Monat Associates Pte Ltd',
        location: 'Singapore',
        picName: 'Shriram Hedge',
        picPosition: 'Executive Director, International',
        email: 'shriram.hedge@monat.com',
        phone: '+6592989847',
        category: 'Insurance',
        userImage: '',
        services: '1. Wealth Planning \n'
            '2. Estate Planning \n'
            '3. Multi Generation Wealth Transfer \n'
            '4. Family and Business Protection Solution \n'
            '5. Liquidity Planning and Asset Protection',
      ),
      SAPModel(
        company: 'Bank Central Asia',
        location: 'Surabaya, Indonesia',
        picName: 'Liem Siu Lan',
        picPosition: 'Branch Manager',
        email: 'liem_siulan@bca.co.id',
        phone: '08155221205',
        category: 'People & Organization Transformation',
        userImage: '',
        services: '1. Consumer Banking \n'
            '2. Corporate Banking \n'
            '3. Mortgage Loan \n'
            '4. Credit Cards \n'
            '5. Investment Banking',
      ),
      SAPModel(
        company: 'Farbe Partner Kreasi',
        location: 'Bandung, Indonesia',
        picName: 'Faldano Malik Hutasuhut',
        picPosition: 'Founder of FPK',
        email: 'hutasuhut.faldano@gmail.com',
        phone: '+6281290008321',
        category: 'Product Photography & Videography',
        userImage: '',
        services: '1. 3D Videography \n'
            '2. Photoshoot Model (Same day Services) \n'
            '3. Social Media Management',
      ),
      SAPModel(
          company: 'Nafas',
          location: 'Jakarta, Indonesia',
          picName: 'Nathan Roestandy',
          picPosition: 'CO-founder & Chief Executive Officer',
          email: 'nathan@nafas.co.id',
          phone: '+628111578787',
          category: 'Environmental Health',
          userImage: '',
          services:
              '1. Clean Air-as-a-Service: subcription based (\$0 CapEx) smart indoor air '
              'quality filtration solutions for buildings and homes  \n'
              '2. Nafas outdoor air quality network: a free to use mobile app that '
              'helps urban citizens understand the quality of air that they are breathing. '
              'Nafas mobile app has over 500,000 downloads and 250+ sensors installed'
              'across 15 cities in Indonesia \n'
              '3. Outdoor air quality monitoring service: helping industries monitor '
              'air quality as part of environmental regulation compliane. \n'),
    ];
