class UpcomingSessionModel {
  String status;
  List<UpcomingSessionData> data;

  UpcomingSessionModel({
    required this.status,
    required this.data,
  });

  factory UpcomingSessionModel.fromJson(Map<String, dynamic> json) {
    return UpcomingSessionModel(
      status: json['status'] as String,
      data: (json['data'] as List)
          .map((e) => UpcomingSessionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class UpcomingSessionData {
  int bookingId;
  int user;
  String userName;
  String userImage;
  int coach;
  String coachName;
  String location;
  String coachImage;
  int coachingArea;
  String coachingAreaName;
  String sessionDate;
  String sessionTime;
  String sessionFormat;
  double price;
  String status;
  String notes;
  String createdAt;
  String updatedAt;

  UpcomingSessionData({
    required this.bookingId,
    required this.user,
    required this.userName,
    required this.userImage,
    required this.coach,
    required this.coachName,
    required this.location,
    required this.coachImage,
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

  factory UpcomingSessionData.fromJson(Map<String, dynamic> json) {
    return UpcomingSessionData(
      bookingId: json['booking_id'] as int,
      user: json['user'] as int,
      userName: json['user_name'] as String,
      userImage: json['user_image'] as String,
      coach: json['coach'] as int,
      coachName: json['coach_name'] as String,
      location: json['location'] as String,
      coachImage: json['coach_image'] as String,
      coachingArea: json['coaching_area'] as int,
      coachingAreaName: json['coaching_area_name'] as String,
      sessionDate: json['session_date'] as String,
      sessionTime: json['session_time'] as String,
      sessionFormat: json['session_format'] as String,
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String,
      notes: json['notes'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
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
      'location': location,
      'coach_image': coachImage,
      'coaching_area': coachingArea,
      'coaching_area_name': coachingAreaName,
      'session_date': sessionDate,
      'session_time': sessionTime,
      'session_format': sessionFormat,
      'price': price,
      'status': status,
      'notes': notes,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
