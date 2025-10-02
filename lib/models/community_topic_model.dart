class CommunityTopicModel {
  final String status;
  final List<CommunityTopic> data;

  CommunityTopicModel({
    required this.status,
    required this.data,
  });

  factory CommunityTopicModel.fromJson(Map<String, dynamic> json) {
    return CommunityTopicModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((e) => CommunityTopic.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class CommunityTopic {
  final int id;
  final String name;

  CommunityTopic({
    required this.id,
    required this.name,
  });

  factory CommunityTopic.fromJson(Map<String, dynamic> json) {
    return CommunityTopic(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

