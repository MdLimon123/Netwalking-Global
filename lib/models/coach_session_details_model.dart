class CoachSessionDetails {
  String status;
  List<CoachSessionData> data;

  CoachSessionDetails({
    required this.status,
    required this.data,
  });

  factory CoachSessionDetails.fromJson(Map<String, dynamic> json) {
    return CoachSessionDetails(
      status: json['status'],
      data: List<CoachSessionData>.from(
        json['data'].map((x) => CoachSessionData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class CoachSessionData {
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

  CoachSessionData({
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

  factory CoachSessionData.fromJson(Map<String, dynamic> json) {
    return CoachSessionData(
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
