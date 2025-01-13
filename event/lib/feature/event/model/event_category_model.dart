class EventCategoryModel {
  int? id;
  String? name;

  EventCategoryModel(
      {this.id, this.name});

  EventCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['event_category_id'];
    name = json['event_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event_category_id'] = id;
    data['event_category_name'] = name;
    return data;
  }
}

List<EventCategoryModel> get listEventCategory => [
  EventCategoryModel(id: 0, name: 'Learning'),
  EventCategoryModel(id: 1, name: 'Member Engagement'),
  EventCategoryModel(id: 2, name: 'MyEO'),
  EventCategoryModel(id: 3, name: 'EOA (EO Accelerator)'),
  EventCategoryModel(id: 4, name: 'Forum'),
];