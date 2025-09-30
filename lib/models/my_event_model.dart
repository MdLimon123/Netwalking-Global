class MyEventModel {
  String status;
  List<MyEventData> data;

  MyEventModel({
    required this.status,
    required this.data,
  });

  factory MyEventModel.fromJson(Map<String, dynamic> json) => MyEventModel(
    status: json["status"],
    data: List<MyEventData>.from(
      json["data"].map((x) => MyEventData.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MyEventData {
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
  int totalParticipants;
  List<Participant> participants;
  String status;
  DateTime createdAt;

  MyEventData({
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
    required this.totalParticipants,
    required this.participants,
    required this.status,
    required this.createdAt,
  });

  factory MyEventData.fromJson(Map<String, dynamic> json) => MyEventData(
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
    totalParticipants: json["total_participants"],
    participants: List<Participant>.from(
      json["participants"].map((x) => Participant.fromJson(x)),
    ),
    status: json["status"],
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
    "total_participants": totalParticipants,
    "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}

class Participant {
  int userId;
  String fullName;
  String image;

  Participant({
    required this.userId,
    required this.fullName,
    required this.image,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    userId: json["user_id"],
    fullName: json["full_name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "full_name": fullName,
    "image": image,
  };
}
