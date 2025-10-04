class BestSuggestMatchModel {
  final int userId;
  final String application;
  final String role;
  final String fullName;
  final String email;
  final String image;
  final String? googleImageUrl;
  final String? facebookId;
  final String? facebookImageUrl;
  final int age;
  final String location;
  final String bio;
  final String ethnicity;
  final String gender;
  final String sexualOrientation;
  final List<String> neurotypes;
  final String profession;
  final String socialMediaLink;
  final String interestsAndProjects;
  final String anythingElse;
  final PrivateFields privateFields;
  final bool isSubscribed;
  final String? subscriptionType;
  final DateTime? subscriptionStart;
  final DateTime? subscriptionEnd;
  final String walkingAvailability;
  final String wakingDistance;
  final String paceSelection;
  final int totalEventJoin;
  final int totalWalk;
  final int totalDayStreak;
  final bool viewAsUser;
  final DateTime dateJoined;
  final DateTime lastLogin;

  BestSuggestMatchModel({
    required this.userId,
    required this.application,
    required this.role,
    required this.fullName,
    required this.email,
    required this.image,
    this.googleImageUrl,
    this.facebookId,
    this.facebookImageUrl,
    required this.age,
    required this.location,
    required this.bio,
    required this.ethnicity,
    required this.gender,
    required this.sexualOrientation,
    required this.neurotypes,
    required this.profession,
    required this.socialMediaLink,
    required this.interestsAndProjects,
    required this.anythingElse,
    required this.privateFields,
    required this.isSubscribed,
    this.subscriptionType,
    this.subscriptionStart,
    this.subscriptionEnd,
    required this.walkingAvailability,
    required this.wakingDistance,
    required this.paceSelection,
    required this.totalEventJoin,
    required this.totalWalk,
    required this.totalDayStreak,
    required this.viewAsUser,
    required this.dateJoined,
    required this.lastLogin,
  });

  factory BestSuggestMatchModel.fromJson(Map<String, dynamic> json) {
    return BestSuggestMatchModel(
      userId: json['user_id'],
      application: json['application'],
      role: json['role'],
      fullName: json['full_name'],
      email: json['email'],
      image: json['image'],
      googleImageUrl: json['google_image_url'],
      facebookId: json['facebook_id'],
      facebookImageUrl: json['facebook_image_url'],
      age: json['age'],
      location: json['location'],
      bio: json['bio'],
      ethnicity: json['ethnicity'],
      gender: json['gender'],
      sexualOrientation: json['sexual_orientation'],
      neurotypes: List<String>.from(json['neurotypes'] ?? []),
      profession: json['profession'],
      socialMediaLink: json['social_media_link'],
      interestsAndProjects: json['interests_and_projects'],
      anythingElse: json['anything_else'],
      privateFields: PrivateFields.fromJson(json['private_fields']),
      isSubscribed: json['is_subscribed'],
      subscriptionType: json['subscription_type'],
      subscriptionStart: json['subscription_start'] != null
          ? DateTime.parse(json['subscription_start'])
          : null,
      subscriptionEnd: json['subscription_end'] != null
          ? DateTime.parse(json['subscription_end'])
          : null,
      walkingAvailability: json['walking_availability'],
      wakingDistance: json['waking_distance'],
      paceSelection: json['pace_selection'],
      totalEventJoin: json['total_event_join'],
      totalWalk: json['total_walk'],
      totalDayStreak: json['total_day_streak'],
      viewAsUser: json['view_as_user'],
      dateJoined: DateTime.parse(json['date_joined']),
      lastLogin: DateTime.parse(json['last_login']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'application': application,
      'role': role,
      'full_name': fullName,
      'email': email,
      'image': image,
      'google_image_url': googleImageUrl,
      'facebook_id': facebookId,
      'facebook_image_url': facebookImageUrl,
      'age': age,
      'location': location,
      'bio': bio,
      'ethnicity': ethnicity,
      'gender': gender,
      'sexual_orientation': sexualOrientation,
      'neurotypes': neurotypes,
      'profession': profession,
      'social_media_link': socialMediaLink,
      'interests_and_projects': interestsAndProjects,
      'anything_else': anythingElse,
      'private_fields': privateFields.toJson(),
      'is_subscribed': isSubscribed,
      'subscription_type': subscriptionType,
      'subscription_start': subscriptionStart?.toIso8601String(),
      'subscription_end': subscriptionEnd?.toIso8601String(),
      'walking_availability': walkingAvailability,
      'waking_distance': wakingDistance,
      'pace_selection': paceSelection,
      'total_event_join': totalEventJoin,
      'total_walk': totalWalk,
      'total_day_streak': totalDayStreak,
      'view_as_user': viewAsUser,
      'date_joined': dateJoined.toIso8601String(),
      'last_login': lastLogin.toIso8601String(),
    };
  }
}

class PrivateFields {
  final bool gender;
  final bool location;

  PrivateFields({required this.gender, required this.location});

  factory PrivateFields.fromJson(Map<String, dynamic> json) {
    return PrivateFields(
      gender: json['gender'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'location': location,
    };
  }
}
