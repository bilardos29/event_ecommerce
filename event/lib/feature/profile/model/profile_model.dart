class ProfileModel {
  String? userId;
  String? email;
  String? firstname;
  String? lastname;
  String? phone;
  String? address;
  String? profileImage;

  ProfileModel({
    this.userId,
    this.email,
    this.firstname,
    this.lastname,
    this.phone,
    this.address,
    this.profileImage,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    firstname = json['first_name'];
    lastname = json['last_name'];
    phone = json['phone'];
    address = json['address'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['email'] = email;
    data['first_name'] = firstname;
    data['last_name'] = lastname;
    data['phone'] = phone;
    data['address'] = address;
    data['profile_image'] = profileImage;
    return data;
  }
}
