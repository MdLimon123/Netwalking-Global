class FindBookingCoachModel {
  final String status;
  final List<FindBookingCoach> data;

  FindBookingCoachModel({
    required this.status,
    required this.data,
  });

  factory FindBookingCoachModel.fromJson(Map<String, dynamic> json) {
    return FindBookingCoachModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FindBookingCoach.fromJson(e))
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

class FindBookingCoach {
  final int bookingId;
  final int user;
  final String userName;
  final String userImage;
  final int coach;
  final String coachName;
  final String coachImage;
  final String location;
  final int coachingArea;
  final String coachingAreaName;
  final String sessionDate;
  final String sessionTime;
  final String sessionFormat;
  final double price;
  final String status;
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  FindBookingCoach({
    required this.bookingId,
    required this.user,
    required this.userName,
    required this.userImage,
    required this.coach,
    required this.coachName,
    required this.coachImage,
    required this.location,
    required this.coachingArea,
    required this.coachingAreaName,
    required this.sessionDate,
    required this.sessionTime,
    required this.sessionFormat,
    required this.price,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FindBookingCoach.fromJson(Map<String, dynamic> json) {
    return FindBookingCoach(
      bookingId: json['booking_id'] ?? 0,
      user: json['user'] ?? 0,
      userName: json['user_name'] ?? '',
      userImage: json['user_image'] ?? '',
      coach: json['coach'] ?? 0,
      coachName: json['coach_name'] ?? '',
      coachImage: json['coach_image'] ?? '',
      location: json['location'] ?? '',
      coachingArea: json['coaching_area'] ?? 0,
      coachingAreaName: json['coaching_area_name'] ?? '',
      sessionDate: json['session_date'] ?? '',
      sessionTime: json['session_time'] ?? '',
      sessionFormat: json['session_format'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? '',
      notes: json['notes'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'user': user,
      'user_name': userName,
      'user_image': userImage,
      'coach': coach,
      'coach_name': coachName,
      'coach_image': coachImage,
      'location': location,
      'coaching_area': coachingArea,
      'coaching_area_name': coachingAreaName,
      'session_date': sessionDate,
      'session_time': sessionTime,
      'session_format': sessionFormat,
      'price': price,
      'status': status,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
