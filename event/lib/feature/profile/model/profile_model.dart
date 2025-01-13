class ProfileModel {
  int? userId;
  String? email;
  String? firstname;
  String? lastname;
  String? phone;
  String? address;
  String? image;
  String? userJoinedDate;
  int? userCategoryId;
  String? userCardNumber;
  String? validUntil;

  ProfileModel({
    this.userId,
    this.email,
    this.firstname,
    this.lastname,
    this.phone,
    this.address,
    this.image,
    this.userJoinedDate,
    this.userCategoryId,
    this.userCardNumber,
    this.validUntil,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    firstname = json['first_name'];
    lastname = json['last_name'];
    phone = json['phone'];
    address = json['address'];
    image = json['user_photo'];
    userJoinedDate = json['user_joined_date'];
    userCategoryId = json['user_category_Id'];
    userCardNumber = json['user_card_number'];
    validUntil = json['valid_until'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['email'] = email;
    data['first_name'] = firstname;
    data['last_name'] = lastname;
    data['phone'] = phone;
    data['address'] = address;
    data['user_photo'] = image;
    data['user_joined_date'] = userJoinedDate;
    data['user_category_Id'] = userCategoryId;
    data['user_card_number'] = userCardNumber;
    data['valid_until'] = validUntil;
    return data;
  }
}

List<ProfileModel> get listProfile => [
      ProfileModel(
        userId: 0,
        email: 'bil@gmail.com',
        firstname: 'Bilardo',
        lastname: 'Situmorang',
        phone: '082130426684',
        address: 'Cikarang Barat',
        validUntil: '11/26',
        userCardNumber: '325',
        userCategoryId: 0,
      ),
      ProfileModel(
        userId: 1,
        email: 'michel@mail.com',
        firstname: 'Michel',
        lastname: 'Sanjaya',
        phone: '085112341234',
        address: 'Jakarta Selatan',
        validUntil: '07/25',
        userCardNumber: '007',
        userCategoryId: 0,
      ),
    ];
