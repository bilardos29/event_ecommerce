class UserModel {
  String? email;
  String? firstname;
  String? lastname;
  String? password;

  UserModel(
      {this.email, this.firstname, this.lastname, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['password'] = password;
    return data;
  }
}