class TopicWishModel {
  final String status;
  final List<TopicWishData> data;

  TopicWishModel({
    required this.status,
    required this.data,
  });

  factory TopicWishModel.fromJson(Map<String, dynamic> json) {
    return TopicWishModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TopicWishData.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class TopicWishData {
  final int id;
  final String userName;
  final String image;
  final int topic;
  final String topicName;
  final String? title;
  final String content;
  final String? postImage;
  final DateTime createdAt;
  final int commentsCount;
  final List<TopicWishComment> comments;
  int likesCount;
  bool isLiked;

  TopicWishData({
    required this.id,
    required this.userName,
    required this.image,
    required this.topic,
    required this.topicName,
    this.title,
    required this.content,
    this.postImage,
    required this.createdAt,
    required this.commentsCount,
    required this.comments,
    required this.likesCount,
    required this.isLiked,
  });

  factory TopicWishData.fromJson(Map<String, dynamic> json) {
    return TopicWishData(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      image: json['image'] ?? '',
      topic: json['topic'] ?? 0,
      topicName: json['topic_name'] ?? '',
      title: json['title'],
      content: json['content'] ?? '',
      postImage: json['post_image'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      commentsCount: json['comments_count'] ?? 0,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => TopicWishComment.fromJson(e))
          .toList() ??
          [],
      likesCount: json['likes_count'] ?? 0,
      isLiked: json['is_liked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'image': image,
      'topic': topic,
      'topic_name': topicName,
      'title': title,
      'content': content,
      'post_image': postImage,
      'created_at': createdAt.toIso8601String(),
      'comments_count': commentsCount,
      'comments': comments.map((e) => e.toJson()).toList(),
      'likes_count': likesCount,
      'is_liked': isLiked,
    };
  }
}

class TopicWishComment {
  final int id;
  final String userName;
  final String image;
  final String content;
  final DateTime createdAt;

  TopicWishComment({
    required this.id,
    required this.userName,
    required this.image,
    required this.content,
    required this.createdAt,
  });

  factory TopicWishComment.fromJson(Map<String, dynamic> json) {
    return TopicWishComment(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      image: json['image'] ?? '',
      content: json['content'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'image': image,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
