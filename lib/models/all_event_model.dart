class AllEventModel {
  String status;
  List<AllEventData> data;

  AllEventModel({
    required this.status,
    required this.data,
  });

  factory AllEventModel.fromJson(Map<String, dynamic> json) {
    return AllEventModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AllEventData.fromJson(e))
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

class AllEventData {
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
  String createdAt;

  AllEventData({
    required this.id,
    required this.userId,
    required this.userName,
    required this.image,
    required this.eventType,
    required this.title,
    required this.description,
    required this.photoBanner,
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

  factory AllEventData.fromJson(Map<String, dynamic> json) {
    return AllEventData(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      userName: json['user_name'] ?? '',
      image: json['image'] ?? '',
      eventType: json['event_type'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      photoBanner: json['photo_banner'],
      location: json['location'] ?? '',
      language: json['language'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      pace: json['pace'] ?? '',
      maxParticipants: json['max_participants'] ?? 0,
      cost: (json['cost'] is int)
          ? (json['cost'] as int).toDouble()
          : (json['cost'] ?? 0.0),
      totalParticipants: json['total_participants'] ?? 0,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => Participant.fromJson(e))
          .toList() ??
          [],
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_name': userName,
      'image': image,
      'event_type': eventType,
      'title': title,
      'description': description,
      'photo_banner': photoBanner,
      'location': location,
      'language': language,
      'date': date,
      'time': time,
      'pace': pace,
      'max_participants': maxParticipants,
      'cost': cost,
      'total_participants': totalParticipants,
      'participants': participants.map((e) => e.toJson()).toList(),
      'status': status,
      'created_at': createdAt,
    };
  }
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

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      userId: json['user_id'] ?? 0,
      fullName: json['full_name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'full_name': fullName,
      'image': image,
    };
  }
}
