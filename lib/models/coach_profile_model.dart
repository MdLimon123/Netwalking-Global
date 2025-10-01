class CoachProfileModel {
  final int userId;
  final CoachRating coachRating;
  final List<int> coachingAreas;
  final List<String> coachingAreaNames;
  final List<int> subCoachingAreas;
  final List<String> subCoachingAreaNames;
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
  final String gender;
  final String walkingAvailability;
  final String wakingDistance;
  final String paceSelection;
  final int totalEventJoin;
  final int totalWalk;
  final int totalDayStreak;
  final bool viewAsUser;
  final List<String> certifications;
  final List<String> languagesSpoken;
  final String? personalWebsite;
  final String? linkedinProfile;
  final String sessionFormat;
  final Availability availability;
  final double pricePerSession;
  final bool neurodiversityAffirming;
  final bool lgbtqiaAffirming;
  final bool genderSensitive;
  final bool traumaSensitive;
  final bool faithBased;
  final DateTime dateJoined;
  final DateTime lastLogin;

  CoachProfileModel({
    required this.userId,
    required this.coachRating,
    required this.coachingAreas,
    required this.coachingAreaNames,
    required this.subCoachingAreas,
    required this.subCoachingAreaNames,
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
    required this.gender,
    required this.walkingAvailability,
    required this.wakingDistance,
    required this.paceSelection,
    required this.totalEventJoin,
    required this.totalWalk,
    required this.totalDayStreak,
    required this.viewAsUser,
    required this.certifications,
    required this.languagesSpoken,
    this.personalWebsite,
    this.linkedinProfile,
    required this.sessionFormat,
    required this.availability,
    required this.pricePerSession,
    required this.neurodiversityAffirming,
    required this.lgbtqiaAffirming,
    required this.genderSensitive,
    required this.traumaSensitive,
    required this.faithBased,
    required this.dateJoined,
    required this.lastLogin,
  });

  factory CoachProfileModel.fromJson(Map<String, dynamic> json) {
    return CoachProfileModel(
      userId: json['user_id'] ?? 0,
      coachRating: CoachRating.fromJson(json['coach_rating']),
      coachingAreas: List<int>.from(json['coaching_areas'] ?? []),
      coachingAreaNames: List<String>.from(json['coaching_area_names'] ?? []),
      subCoachingAreas: List<int>.from(json['sub_coaching_areas'] ?? []),
      subCoachingAreaNames: List<String>.from(json['sub_coaching_area_names'] ?? []),
      application: json['application'] ?? '',
      role: json['role'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      googleImageUrl: json['google_image_url'],
      facebookId: json['facebook_id'],
      facebookImageUrl: json['facebook_image_url'],
      age: json['age'] ?? 0,
      location: json['location'] ?? '',
      bio: json['bio'] ?? '',
      gender: json['gender'] ?? '',
      walkingAvailability: json['walking_availability'] ?? '',
      wakingDistance: json['waking_distance'] ?? '',
      paceSelection: json['pace_selection'] ?? '',
      totalEventJoin: json['total_event_join'] ?? 0,
      totalWalk: json['total_walk'] ?? 0,
      totalDayStreak: json['total_day_streak'] ?? 0,
      viewAsUser: json['view_as_user'] ?? false,
      certifications: List<String>.from(json['certifications'] ?? []),
      languagesSpoken: List<String>.from(json['languages_spoken'] ?? []),
      personalWebsite: json['personal_website'],
      linkedinProfile: json['linkedin_profile'],
      sessionFormat: json['session_format'] ?? '',
        availability: Availability.fromJson(json['availability'] ?? {}),
      pricePerSession: (json['price_per_session'] ?? 0).toDouble(),
      neurodiversityAffirming: json['neurodiversity_affirming'] ?? false,
      lgbtqiaAffirming: json['lgbtqia_affirming'] ?? false,
      genderSensitive: json['gender_sensitive'] ?? false,
      traumaSensitive: json['trauma_sensitive'] ?? false,
      faithBased: json['faith_based'] ?? false,
      dateJoined: DateTime.parse(json['date_joined']),
      lastLogin: DateTime.parse(json['last_login']),
    );
  }
}

class CoachRating {
  final double avgRating;
  final int totalReviews;

  CoachRating({required this.avgRating, required this.totalReviews});

  factory CoachRating.fromJson(Map<String, dynamic> json) {
    return CoachRating(
      avgRating: (json['avg_rating'] ?? 0).toDouble(),
      totalReviews: json['total_reviews'] ?? 0,
    );
  }
}

class Availability {
  final List<TimeSlot> monday;
  final List<TimeSlot> tuesday;
  final List<TimeSlot>? wednesday;
  final List<TimeSlot>? thursday;
  final List<TimeSlot>? friday;
  final List<TimeSlot>? saturday;
  final List<TimeSlot>? sunday;

  Availability({
    required this.monday,
    required this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    List<TimeSlot> parseDay(dynamic day) {
      if (day == null) return [];
      return (day as List).map((e) => TimeSlot.fromJson(e)).toList();
    }

    return Availability(
      monday: parseDay(json['monday']),
      tuesday: parseDay(json['tuesday']),
      wednesday: parseDay(json['wednesday']),
      thursday: parseDay(json['thursday']),
      friday: parseDay(json['friday']),
      saturday: parseDay(json['saturday']),
      sunday: parseDay(json['sunday']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'monday': monday.map((e) => e.toJson()).toList(),
      'tuesday': tuesday.map((e) => e.toJson()).toList(),
      'wednesday': wednesday?.map((e) => e.toJson()).toList(),
      'thursday': thursday?.map((e) => e.toJson()).toList(),
      'friday': friday?.map((e) => e.toJson()).toList(),
      'saturday': saturday?.map((e) => e.toJson()).toList(),
      'sunday': sunday?.map((e) => e.toJson()).toList(),
    };
  }
}

class TimeSlot {
  final String from;
  final String to;

  TimeSlot({
    required this.from,
    required this.to,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      from: json['from'],
      to: json['to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
    };
  }
}
