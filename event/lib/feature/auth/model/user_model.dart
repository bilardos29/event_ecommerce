class UserModel {
  String? email;
  String? firstname;
  String? lastname;
  String? password;
  int? userCategoryId;

  UserModel({
    this.email,
    this.firstname,
    this.lastname,
    this.password,
    this.userCategoryId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['password'];
    userCategoryId = json['user_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['password'] = password;
    data['user_category_id'] = userCategoryId;
    return data;
  }
}

List<UserModel> get listUser => [
      UserModel(
        email: 'michel@mail.com',
        firstname: 'Michel',
        lastname: 'Sanjaya',
        password: '12345',
        userCategoryId: 0
      ),
      UserModel(
        email: 'bil@gmail.com',
        firstname: 'Bilardo',
        lastname: 'Situmorang',
        password: '12345',
        userCategoryId: 0
      ),
    ];
