class SessionBookingDetailsModel {
  final String status;
  final List<SessionBookingData> data;

  SessionBookingDetailsModel({
    required this.status,
    required this.data,
  });

  factory SessionBookingDetailsModel.fromJson(Map<String, dynamic> json) {
    return SessionBookingDetailsModel(
      status: json['status'],
      data: (json['data'] as List<dynamic>)
          .map((e) => SessionBookingData.fromJson(e))
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

class SessionBookingData {
  final int bookingId;
  final int user;
  final String userName;
  final String userImage;
  final int coach;
  final String coachName;
  final String location;
  final String coachImage;
  final int coachingArea;
  final String coachingAreaName;
  final String sessionDate;
  final String sessionTime;
  final String sessionFormat;
  final double price;
  final String status;
  final String? notes;
  final String createdAt;
  final String updatedAt;

  SessionBookingData({
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
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SessionBookingData.fromJson(Map<String, dynamic> json) {
    return SessionBookingData(
      bookingId: json['booking_id'],
      user: json['user'],
      userName: json['user_name'],
      userImage: json['user_image'],
      coach: json['coach'],
      coachName: json['coach_name'],
      location: json['location'],
      coachImage: json['coach_image'],
      coachingArea: json['coaching_area'],
      coachingAreaName: json['coaching_area_name'],
      sessionDate: json['session_date'],
      sessionTime: json['session_time'],
      sessionFormat: json['session_format'],
      price: (json['price'] as num).toDouble(),
      status: json['status'],
      notes: json['notes'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
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
