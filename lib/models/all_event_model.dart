class AllEventModel {
  String status;
  List<EventData> data;

  AllEventModel({
    required this.status,
    required this.data,
  });

  factory AllEventModel.fromJson(Map<String, dynamic> json) => AllEventModel(
    status: json["status"],
    data: List<EventData>.from(
      json["data"].map((x) => EventData.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class EventData {
  int id;
  int userId;
  String userName;
  String image;
  String eventType;
  String title;
  String description;
  String? photoBanner;
  String location;
  String language;
  String date;
  String time;
  String pace;
  int maxParticipants;
  double cost;
  List<dynamic> participants;
  DateTime createdAt;

  EventData({
    required this.id,
    required this.userId,
    required this.userName,
    required this.image,
    required this.eventType,
    required this.title,
    required this.description,
    this.photoBanner,
    required this.location,
    required this.language,
    required this.date,
    required this.time,
    required this.pace,
    required this.maxParticipants,
    required this.cost,
    required this.participants,
    required this.createdAt,
  });

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
    id: json["id"],
    userId: json["user_id"],
    userName: json["user_name"],
    image: json["image"],
    eventType: json["event_type"],
    title: json["title"],
    description: json["description"],
    photoBanner: json["photo_banner"],
    location: json["location"],
    language: json["language"],
    date: json["date"],
    time: json["time"],
    pace: json["pace"],
    maxParticipants: json["max_participants"],
    cost: (json["cost"] as num).toDouble(),
    participants: List<dynamic>.from(json["participants"].map((x) => x)),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user_name": userName,
    "image": image,
    "event_type": eventType,
    "title": title,
    "description": description,
    "photo_banner": photoBanner,
    "location": location,
    "language": language,
    "date": date,
    "time": time,
    "pace": pace,
    "max_participants": maxParticipants,
    "cost": cost,
    "participants": List<dynamic>.from(participants.map((x) => x)),
    "created_at": createdAt.toIso8601String(),
  };
}
