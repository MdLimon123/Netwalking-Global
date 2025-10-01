class CoachFilterModel {
  final String status;
  final int totalCoaches;
  final List<CoachFilterData> data;

  CoachFilterModel({
    required this.status,
    required this.totalCoaches,
    required this.data,
  });

  factory CoachFilterModel.fromJson(Map<String, dynamic> json) {
    return CoachFilterModel(
      status: json['status'] ?? '',
      totalCoaches: json['total_coaches'] ?? 0,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CoachFilterData.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'total_coaches': totalCoaches,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class CoachFilterData {
  final int userId;
  final List<int> coachingAreas;
  final List<String> coachingAreaNames;
  final List<int> subCoachingAreas;
  final List<String> subCoachingAreaNames;
  final String fullName;
  final String image;
  final int age;
  final String location;
  final String bio;
  final String gender;


  CoachFilterData({
    required this.userId,

    required this.coachingAreas,
    required this.coachingAreaNames,
    required this.subCoachingAreas,
    required this.subCoachingAreaNames,
    required this.fullName,
    required this.image,
    required this.age,
    required this.location,
    required this.bio,
    required this.gender,

  });

  factory CoachFilterData.fromJson(Map<String, dynamic> json) {
    return CoachFilterData(
      userId: json['user_id'] ?? 0,
      coachingAreas: (json['coaching_areas'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList() ??
          [],
      coachingAreaNames: (json['coaching_area_names'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      subCoachingAreas: (json['sub_coaching_areas'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList() ??
          [],
      subCoachingAreaNames: (json['sub_coaching_area_names'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],

      fullName: json['full_name'] ?? '',

      image: json['image'] ?? '',

      age: json['age'] ?? 0,
      location: json['location'] ?? '',
      bio: json['bio'] ?? '',
      gender: json['gender'] ?? '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,

      'coaching_areas': coachingAreas,
      'coaching_area_names': coachingAreaNames,
      'sub_coaching_areas': subCoachingAreas,
      'sub_coaching_area_names': subCoachingAreaNames,


      'full_name': fullName,

      'image': image,

      'age': age,
      'location': location,
      'bio': bio,
      'gender': gender,


    };
  }
}

