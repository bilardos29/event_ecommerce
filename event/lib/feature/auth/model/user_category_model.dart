class UserCategoryModel {
  int? id;
  String? name;

  UserCategoryModel(
      {this.id, this.name});

  UserCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['user_category_id'];
    name = json['user_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_category_id'] = id;
    data['user_category_name'] = name;
    return data;
  }
}

List<UserCategoryModel> get listUserCat => [
  UserCategoryModel(id: 0, name: 'EO Member'),
  UserCategoryModel(id: 1, name: 'SLF'),
  UserCategoryModel(id: 2, name: 'NextGen'),
];