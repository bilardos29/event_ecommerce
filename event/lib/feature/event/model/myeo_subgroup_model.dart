class MyEOSubGroupModel {
  int? groupId;
  int? id;
  String? name;

  MyEOSubGroupModel(
      {this.groupId, this.id, this.name});

  MyEOSubGroupModel.fromJson(Map<String, dynamic> json) {
    groupId = json['myeo_group_id'];
    id = json['myeo_subgroup_id'];
    name = json['myeo_subgroup_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['myeo_group_id'] = groupId;
    data['myeo_subgroup_id'] = id;
    data['myeo_subgroup_name'] = name;
    return data;
  }
}

List<MyEOSubGroupModel> get listInterestGroup => [
  MyEOSubGroupModel(groupId: 0, id: 0, name: 'MyEO Golf'),
  MyEOSubGroupModel(groupId: 0, id: 1, name: 'MyEO Badminton'),
  MyEOSubGroupModel(groupId: 0, id: 2, name: 'MyEO Driving'),
  MyEOSubGroupModel(groupId: 0, id: 3, name: 'MyEO Driving'),
  MyEOSubGroupModel(groupId: 0, id: 4, name: 'MyEO Royal Flush'),
  MyEOSubGroupModel(groupId: 0, id: 5, name: 'MyEO Royal Flush'),
  MyEOSubGroupModel(groupId: 0, id: 6, name: 'MyEO Metaphysics'),

  MyEOSubGroupModel(groupId: 1, id: 7, name: 'MyEO Sisterhood'),
  MyEOSubGroupModel(groupId: 1, id: 8, name: 'MyEO Culinary'),
  MyEOSubGroupModel(groupId: 1, id: 9, name: 'MyEO Pets'),
  MyEOSubGroupModel(groupId: 1, id: 10, name: 'MyEO Teman Minum'),
  MyEOSubGroupModel(groupId: 1, id: 11, name: 'MyEO Power Breakfast'),
  MyEOSubGroupModel(groupId: 1, id: 12, name: 'MyEO Power Breakfast'),

  MyEOSubGroupModel(groupId: 2, id: 13, name: 'MyEO Online Business'),
  MyEOSubGroupModel(groupId: 2, id: 14, name: 'MyEO Real Estate'),
  MyEOSubGroupModel(groupId: 2, id: 15, name: 'MyEO Factories Unite'),
  MyEOSubGroupModel(groupId: 2, id: 16, name: 'MyEO Stockholder'),
  MyEOSubGroupModel(groupId: 2, id: 17, name: 'MyEO Stockholder'),
];