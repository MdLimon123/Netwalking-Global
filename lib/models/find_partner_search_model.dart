class FindPartnerSearchModel {
  final String status;
  final List<FindPartnerSearchData> data;

  FindPartnerSearchModel({
    required this.status,
    required this.data,
  });

  factory FindPartnerSearchModel.fromJson(Map<String, dynamic> json) {
    return FindPartnerSearchModel(
      status: json['status'] ?? '', // api te spelling mistake ase "ststus"
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FindPartnerSearchData.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "data": data.map((e) => e.toJson()).toList(),
    };
  }
}

class FindPartnerSearchData {
  final int userId;
  final String fullName;
  final String image;
  final String location;
  final String walkingAvailability;
  final String wakingDistance;
  final String paceSelection;
  final String profession;

  FindPartnerSearchData({
    required this.userId,
    required this.fullName,
    required this.image,
    required this.location,
    required this.walkingAvailability,
    required this.wakingDistance,
    required this.paceSelection,
    required this.profession,

  });

  factory FindPartnerSearchData.fromJson(Map<String, dynamic> json) {
    return FindPartnerSearchData(
      userId: json['user_id'] ?? 0,
      fullName: json['full_name'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
      walkingAvailability: json['walking_availability'] ?? '',
      wakingDistance: json['waking_distance'] ?? '',
      paceSelection: json['pace_selection'] ?? '',
      profession: json['profession'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "full_name": fullName,
      "image": image,
      "location": location,
      "walking_availability": walkingAvailability,
      "waking_distance": wakingDistance,
      "pace_selection": paceSelection,
      "profession": profession,
    };
  }
}

