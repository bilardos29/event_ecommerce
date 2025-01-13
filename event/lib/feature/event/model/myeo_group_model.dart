class MyEOGroupModel {
  int? id;
  String? name;

  MyEOGroupModel(
      {this.id, this.name});

  MyEOGroupModel.fromJson(Map<String, dynamic> json) {
    id = json['myeo_group_id'];
    name = json['myeo_group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['myeo_group_id'] = id;
    data['myeo_group_name'] = name;
    return data;
  }
}

List<MyEOGroupModel> get listInterestGroup => [
  MyEOGroupModel(id: 0, name: 'Sport/Interest'),
  MyEOGroupModel(id: 1, name: 'Social/Community'),
  MyEOGroupModel(id: 2, name: 'Industry/Current Issues'),
];