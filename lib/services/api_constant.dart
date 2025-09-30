


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

}