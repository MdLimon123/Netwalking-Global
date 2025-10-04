class SinglePostModel {
  final int id;
  final String userName;
  final String image;
  final int topic;
  final String topicName;
  final String title;
  final String content;
  final String postImage;
  final DateTime createdAt;
  final int commentsCount;
  final List<SingleCommentData> comments;
   int likesCount;
   bool isLiked;

  SinglePostModel({
    required this.id,
    required this.userName,
    required this.image,
    required this.topic,
    required this.topicName,
    required this.title,
    required this.content,
    required this.postImage,
    required this.createdAt,
    required this.commentsCount,
    required this.comments,
    required this.likesCount,
    required this.isLiked,
  });

  factory SinglePostModel.fromJson(Map<String, dynamic> json) {
    return SinglePostModel(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      image: json['image'] ?? '',
      topic: json['topic'] ?? 0,
      topicName: json['topic_name'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      postImage: json['post_image'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      commentsCount: json['comments_count'] ?? 0,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => SingleCommentData.fromJson(e))
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

class SingleCommentData {
  final int id;
  final String userName;
  final String image;
  final String content;
  final DateTime createdAt;

  SingleCommentData({
    required this.id,
    required this.userName,
    required this.image,
    required this.content,
    required this.createdAt,
  });

  factory SingleCommentData.fromJson(Map<String, dynamic> json) {
    return SingleCommentData(
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
