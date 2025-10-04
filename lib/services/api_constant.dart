


class ApiConstant{
  //http://172.252.13.79:3212
  //static String baseUrl="http://10.10.12.49:8003"; // live
  static String baseUrl="http://10.10.12.49:8001"; // local
  static String imageBaseUrl = "http://10.10.12.49:8001";
  static String signInEndPoint = "/api/v1/auth/signup/";
  static String emailVerificationEndPoint = "/api/v1/auth/verify-email/";
  static String loginEndPoint = "/api/v1/auth/login/";
  static String sendOtpEndPoint = "/api/v1/auth/send-otp/";
  static String resetPasswordEndPoint = "/api/v1/auth/reset-password/";
  static String profileSetupEndPoint = "/api/v1/auth/profile/";
  static String getProfileEndPoint = "/api/v1/auth/profile/";
  static String addEventEndPoint = "/api/v1/event/events/";
  static String myEventEndPoint = "/api/v1/event/my_events/";
  static String allEventEndPoint = "/api/v1/event/events/";
  static String eventDetails({required int id}) => "/api/v1/event/events/$id/";
  static String joinEventEndPoint({required int id}) => "/api/v1/event/events/join/$id/";
  static String getAllCommunityEndPoint = "/api/v1/community/posts/";
  static String findBookingCoachEndPoint = "/api/v1/auth/bookings/user/";
  static String allCategoryEndPoint = "/api/v1/auth/coach-categories/";
  static String coachFilterEndPoint = "/api/v1/auth/coaches/filter/";
  static String coachProfileEndPoint({required int id}) => "/api/v1/auth/user/$id/";
  static String coachBookingEndPoint = "/api/v1/auth/bookings/create/";
  static String sessionDetailsEndPoint({required int id}) => "/api/v1/auth/bookings/user/$id/";
  static String findPartnerWalkEndPoint = "/api/v1/auth/invitations/";
  static String searchForPartnerWalkEndPoint = "/api/v1/auth/walking_partner/search/";
  static String singleUserProfileEndPoint({required int id}) => "/api/v1/auth/user/$id/";
  static String postTopicEndPoint = "/api/v1/community/topics/";
  static String addNewPostEndPoint = "/api/v1/community/posts/";
  static String singlePostDetails({required int id}) => "/api/v1/community/posts/$id/";
  static String commentPostEndPoint({required int id}) => "/api/v1/community/posts/$id/comments/";
  static String likePostEndPoint({required int id}) => "/api/v1/community/posts/$id/like/";
  static String topicWishSinglePostDetails ({required int id}) => "/api/v1/community/topic_wise_post/$id/";
  static String bestSuggestedMatchEndPoint = "/api/v1/auth/best-matches/";
  static String sendInvitationEndPoint = "/api/v1/auth/invitations/";

}