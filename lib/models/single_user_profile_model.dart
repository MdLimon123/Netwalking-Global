class SingleUserProfileModel {
  final String status;
  final UserProfile user;

  SingleUserProfileModel({
    required this.status,
    required this.user,
  });

  factory SingleUserProfileModel.fromJson(Map<String, dynamic> json) {
    return SingleUserProfileModel(
      status: json['status'] ?? '',
      user: UserProfile.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "user": user.toJson(),
    };
  }
}

class UserProfile {
  final int userId;
  final String fullName;
  final String email;
  final String image;
  final int age;
  final String location;
  final String bio;
  final String ethnicity;
  final String gender;
  final String sexualOrientation;
  final List<String> neurotypes;
  final String profession;
  final PrivateFields privateFields;
  final String paceSelection;
  final int totalEventJoin;
  final int totalWalk;
  final int totalDayStreak;
  final bool viewAsUser;

  UserProfile({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.image,
    required this.age,
    required this.location,
    required this.bio,
    required this.ethnicity,
    required this.gender,
    required this.sexualOrientation,
    required this.neurotypes,
    required this.profession,
    required this.privateFields,
    required this.paceSelection,
    required this.totalEventJoin,
    required this.totalWalk,
    required this.totalDayStreak,
    required this.viewAsUser,

  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['user_id'] ?? 0,

      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      age: json['age'] ?? 0,
      location: json['location'] ?? '',
      bio: json['bio'] ?? '',
      ethnicity: json['ethnicity'] ?? '',
      gender: json['gender'] ?? '',
      sexualOrientation: json['sexual_orientation'] ?? '',
      neurotypes: List<String>.from(json['neurotypes'] ?? []),
      profession: json['profession'] ?? '',
      privateFields: PrivateFields.fromJson(json['private_fields'] ?? {}),
      paceSelection: json['pace_selection'] ?? '',
      totalEventJoin: json['total_event_join'] ?? 0,
      totalWalk: json['total_walk'] ?? 0,
      totalDayStreak: json['total_day_streak'] ?? 0,
      viewAsUser: json['view_as_user'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "full_name": fullName,
      "email": email,
      "image": image,
      "age": age,
      "location": location,
      "bio": bio,
      "ethnicity": ethnicity,
      "gender": gender,
      "sexual_orientation": sexualOrientation,
      "neurotypes": neurotypes,
      "profession": profession,
      "private_fields": privateFields.toJson(),
      "pace_selection": paceSelection,
      "total_event_join": totalEventJoin,
      "total_walk": totalWalk,
      "total_day_streak": totalDayStreak,
      "view_as_user": viewAsUser,
    };
  }
}

class PrivateFields {
  final bool gender;
  final bool location;

  PrivateFields({
    required this.gender,
    required this.location,
  });

  factory PrivateFields.fromJson(Map<String, dynamic> json) {
    return PrivateFields(
      gender: json['gender'] ?? false,
      location: json['location'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "gender": gender,
      "location": location,
    };
  }
}
