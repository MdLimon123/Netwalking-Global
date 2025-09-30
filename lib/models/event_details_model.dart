class EventDetailsModel {
  final int id;
  final int userId;
  final String userName;
  final String image;
  final String eventType;
  final String title;
  final String description;
  final String photoBanner;
  final String location;
  final String language;
  final String date;
  final String time;
  final String pace;
  final int maxParticipants;
  final double cost;
  final int totalParticipants;
  final List<Participant> participants;
  final String status;
  final DateTime createdAt;

  EventDetailsModel({
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

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) {
    return EventDetailsModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      userName: json['user_name'] ?? '',
      image: json['image'] ?? '',
      eventType: json['event_type'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      photoBanner: json['photo_banner'] ?? '',
      location: json['location'] ?? '',
      language: json['language'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      pace: json['pace'] ?? '',
      maxParticipants: json['max_participants'] ?? 0,
      cost: (json['cost'] ?? 0).toDouble(),
      totalParticipants: json['total_participants'] ?? 0,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => Participant.fromJson(e))
          .toList() ??
          [],
      status: json['status'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
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
      'created_at': createdAt.toIso8601String(),
    };
  }
}

class Participant {
  final int userId;
  final String fullName;
  final String image;

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
