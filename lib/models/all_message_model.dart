class AllMessageModel {
  final int id;
  final int room;
  final int sender;
  final String content;
  final List<String>? images;
  final bool isSeen;
  final DateTime timestamp;

  AllMessageModel({
    required this.id,
    required this.room,
    required this.sender,
    required this.content,
    this.images,
    required this.isSeen,
    required this.timestamp,
  });

  factory AllMessageModel.fromJson(Map<String, dynamic> json) {
    return AllMessageModel(
      id: json['id'],
      room: json['room'],
      sender: json['sender'],
      content: json['content'] ?? '',
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : null,
      isSeen: json['is_seen'] ?? false,
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "room": room,
      "sender": sender,
      "content": content,
      "images": images,
      "is_seen": isSeen,
      "timestamp": timestamp.toIso8601String(),
    };
  }
}
