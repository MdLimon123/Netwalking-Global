import 'package:get/get.dart';
import 'package:netwalking_global/views/screen/Auth/login_screen.dart';
import 'package:netwalking_global/views/screen/Auth/otp_verify_screen.dart';
import 'package:netwalking_global/views/screen/Auth/reset_password_screen.dart';
import 'package:netwalking_global/views/screen/Auth/signup_screen.dart';
import 'package:netwalking_global/views/screen/Auth/successful_screen.dart';
import 'package:netwalking_global/views/screen/Chat/inbox_screen.dart';
import 'package:netwalking_global/views/screen/Community/wallet_screen.dart';
import 'package:netwalking_global/views/screen/SelectLanguage/select_language_screen.dart';
import 'package:netwalking_global/views/screen/SetUpProfile/complete_screen.dart';
import 'package:netwalking_global/views/screen/SetUpProfile/disability_accessibility_screen.dart';
import 'package:netwalking_global/views/screen/SetUpProfile/set_up_profile_screen.dart';
import 'package:netwalking_global/views/screen/SetUpProfile/set_your_walking_preferenees_screen.dart';
import 'package:netwalking_global/views/screen/Splash/onboarding_screen.dart';
import '../views/screen/Home/home_screen.dart';
import '../views/screen/Profile/profile_screen.dart';
import '../views/screen/Splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String homeScreen="/home_screen";
  static String profileScreen="/profile_screen";
  static String communityScreen="/community_screen";
  static String onboradingScreen="/onboarding_screen";
  static String selectLanguage = "/select_language_screen";
  static String loginScreen = "/login_screen";
  static String signupScreen = "/signup_screen";
  static String otoVerifyScreen = "/otp_verify_screen";
  static String resetPasswordScreen = "/reset_password_screen";
  static String successfulScreen = "/successful_screen";
  static String setupProfileScreen = "/setup_profile_screen";
  static String disabilityAccessibilityScreen = "/disability_accessibility_screen";
  static String setYourWalkingPrefereneesScreen = "/set_your_walking_preferenees_screen";
  static String completeScreen = "/compete_screen";
  static String inboxScreen = "/inbox_screen";


 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:homeScreen, page: ()=>const HomeScreen(),transition:Transition.noTransition),
    GetPage(name:communityScreen, page: ()=>const CommunityScreen(),transition:Transition.noTransition),
    GetPage(name:profileScreen, page: ()=>const ProfileScreen(),transition: Transition.noTransition),
    GetPage(name:onboradingScreen, page: ()=>const OnboardingScreen(),transition: Transition.noTransition),
   GetPage(name: selectLanguage, page: ()=> const SelectLanguageScreen(), transition: Transition.noTransition),
   GetPage(name: loginScreen, page: ()=> const LoginScreen(), transition: Transition.noTransition),
   GetPage(name: signupScreen, page: ()=> const SignupScreen(), transition: Transition.noTransition),
   GetPage(name: otoVerifyScreen, page: ()=> const OtpVerifyScreen(), transition: Transition.noTransition),
   GetPage(name: resetPasswordScreen, page: ()=> const ResetPasswordScreen(), transition: Transition.noTransition),
   GetPage(name: successfulScreen, page: ()=> const SuccessfulScreen(), transition: Transition.noTransition),
   GetPage(name: setupProfileScreen, page: ()=> const SetUpProfileScreen(), transition: Transition.noTransition),
   GetPage(name: disabilityAccessibilityScreen, page: ()=> const DisabilityAccessibilityScreen(), transition: Transition.noTransition),
   GetPage(name: setYourWalkingPrefereneesScreen, page: ()=> const SetYourWalkingPrefereneesScreen(), transition: Transition.noTransition),
   GetPage(name: completeScreen, page: ()=> const CompleteScreen(), transition: Transition.noTransition),
   GetPage(name: inboxScreen, page: ()=> const InboxScreen(), transition: Transition.noTransition),


  ];



}