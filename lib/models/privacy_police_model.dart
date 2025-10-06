class PrivacyPoliceModel {
  final int id;
  final String application;
  final String title;
  final String content;
  final DateTime createdOn;
  final DateTime updatedOn;

  PrivacyPoliceModel({
    required this.id,
    required this.application,
    required this.title,
    required this.content,
    required this.createdOn,
    required this.updatedOn,
  });

  factory PrivacyPoliceModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPoliceModel(
      id: json['id'] as int,
      application: json['application'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdOn: DateTime.parse(json['created_on']),
      updatedOn: DateTime.parse(json['updated_on']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'application': application,
      'title': title,
      'content': content,
      'created_on': createdOn.toIso8601String(),
      'updated_on': updatedOn.toIso8601String(),
    };
  }
}
