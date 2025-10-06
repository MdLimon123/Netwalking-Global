class InboxMessageModel {
  final int roomId;
  final User user;
   LastMessage? lastMessage;
  final int unseenCount;
  final DateTime createdAt;

  InboxMessageModel({
    required this.roomId,
    required this.user,
     this.lastMessage,
    required this.unseenCount,
    required this.createdAt,
  });

  factory InboxMessageModel.fromJson(Map<String, dynamic> json) {
    return InboxMessageModel(
      roomId: json['room_id'],
      user: User.fromJson(json['user']),
      lastMessage: json['last_message'] != null
          ? LastMessage.fromJson(json['last_message'])
          : null,   // null handle
      unseenCount: json['unseen_count'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() => {
    'room_id': roomId,
    'user': user.toJson(),
    'last_message': lastMessage?.toJson(),
    'unseen_count': unseenCount,
    'created_at': createdAt.toIso8601String(),
  };
}

class User {
  final int userId;
  final String fullName;
  final String image;

  User({
    required this.userId,
    required this.fullName,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      fullName: json['full_name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'full_name': fullName,
    'image': image,
  };
}

class LastMessage {
  final String content;
  final DateTime timestamp;
  final int senderId;

  LastMessage({
    required this.content,
    required this.timestamp,
    required this.senderId,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
      senderId: json['sender_id'],
    );
  }

  Map<String, dynamic> toJson() => {
    'content': content,
    'timestamp': timestamp.toIso8601String(),
    'sender_id': senderId,
  };
}
