class GroupModel {
  final String id;
  final String name;

  GroupModel({
    required this.id,
    required this.name,
  });

  factory GroupModel.fromJson(Map<String, dynamic> jsonData) {
    return GroupModel(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }
}
