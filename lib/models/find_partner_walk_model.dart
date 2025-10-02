class FindPartnerWalkModel {
  final String status;
  final List<FindPartnerWalkData> data;

  FindPartnerWalkModel({
    required this.status,
    required this.data,
  });

  factory FindPartnerWalkModel.fromJson(Map<String, dynamic> json) {
    return FindPartnerWalkModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FindPartnerWalkData.fromJson(e))
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

class FindPartnerWalkData {
  final int id;
  final int inviteUserId;
  final String inviteUserName;
  final String inviteUserImage;
  final int invitedUserId;
  final String invitedUserName;
  final String invitedUserImage;
  final String walkingAvailability;
  final String wakingDistance;
  final String paceSelection;
  final String sessionDate;
  final String status;
  final String notes;
  final String createdAt;
  final String updatedAt;

  FindPartnerWalkData({
    required this.id,
    required this.inviteUserId,
    required this.inviteUserName,
    required this.inviteUserImage,
    required this.invitedUserId,
    required this.invitedUserName,
    required this.invitedUserImage,
    required this.walkingAvailability,
    required this.wakingDistance,
    required this.paceSelection,
    required this.sessionDate,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FindPartnerWalkData.fromJson(Map<String, dynamic> json) {
    return FindPartnerWalkData(
      id: json['id'] ?? 0,
      inviteUserId: json['invite_user_id'] ?? 0,
      inviteUserName: json['invite_user_name'] ?? '',
      inviteUserImage: json['invite_user_image'] ?? '',
      invitedUserId: json['invited_user_id'] ?? 0,
      invitedUserName: json['invited_user_name'] ?? '',
      invitedUserImage: json['invited_user_image'] ?? '',
      walkingAvailability: json['walking_availability'] ?? '',
      wakingDistance: json['waking_distance'] ?? '',
      paceSelection: json['pace_selection'] ?? '',
      sessionDate: json['session_date'] ?? '',
      status: json['status'] ?? '',
      notes: json['notes'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "invite_user_id": inviteUserId,
      "invite_user_name": inviteUserName,
      "invite_user_image": inviteUserImage,
      "invited_user_id": invitedUserId,
      "invited_user_name": invitedUserName,
      "invited_user_image": invitedUserImage,
      "walking_availability": walkingAvailability,
      "waking_distance": wakingDistance,
      "pace_selection": paceSelection,
      "session_date": sessionDate,
      "status": status,
      "notes": notes,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
