
import 'dart:convert';

import 'package:get/get.dart';
import 'package:netwalking_global/utils/common_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataController extends GetxController{

  /// user observable variables
  var id = 0.obs;
  var application = "".obs;
  var role = "".obs;
  var name = "".obs;
  var email = "".obs;
  var profileImage = "".obs;
  var googleImageUrl = "".obs;
  var facebookId = "".obs;
  var facebookImageUrl = "".obs;
  var age = 0.obs;
  var location = "".obs;
  var bio = "".obs;
  var ethnicity = "".obs;
  var gender = "".obs;
  var sexualOrientation = "".obs;
  var neurotypes = <String>[].obs;
  var profession = "".obs;
  var socialMediaLink = "".obs;
  var interestsAndProjects = "".obs;
  var anythingElse = "".obs;
  var isSubscribed = false.obs;
  var subscriptionType = "".obs;
  var subscriptionStart = "".obs;
  var subscriptionEnd = "".obs;
  var dateJoined = "".obs;
  var lastLogin = "".obs;
  var totalEventJoin = 0.obs;
  var totalWalk = 0.obs;
  var totalDayStreak = 0.obs;

  late SharedPreferences _prefs;


  /// Coach-specific data




  /// -------- USER SET --------------
  Future<void> setUserData(Map<String, dynamic> d) async {
    _prefs = await SharedPreferences.getInstance();

    id.value               = d['user_id'] ?? 0;
    application.value      = d['application'] ?? "";
    role.value             = d['role'] ?? "";
    name.value             = d['full_name'] ?? "";
    email.value            = d['email'] ?? "";
    profileImage.value     = d['image'] ?? "";
    googleImageUrl.value   = d['google_image_url'] ?? "";
    facebookId.value       = d['facebook_id'] ?? "";
    facebookImageUrl.value = d['facebook_image_url'] ?? "";
    age.value              = d['age'] ?? 0;
    location.value         = d['location'] ?? "";
    bio.value              = d['bio'] ?? "";
    ethnicity.value        = d['ethnicity'] ?? "";
    gender.value           = d['gender'] ?? "";
    sexualOrientation.value= d['sexual_orientation'] ?? "";
    neurotypes.value       = List<String>.from(d['neurotypes'] ?? []);
    profession.value       = d['profession'] ?? "";
    socialMediaLink.value  = d['social_media_link'] ?? "";
    interestsAndProjects.value = d['interests_and_projects'] ?? "";
    anythingElse.value     = d['anything_else'] ?? "";
    isSubscribed.value     = d['is_subscribed'] ?? false;
    subscriptionType.value = d['subscription_type'] ?? "";
    subscriptionStart.value= d['subscription_start'] ?? "";
    subscriptionEnd.value  = d['subscription_end'] ?? "";
    dateJoined.value       = d['date_joined'] ?? "";
    lastLogin.value        = d['last_login'] ?? "";
    totalEventJoin.value   = d['total_event_join'] ?? 0;
    totalWalk.value        = d['total_walk'] ?? 0;
    totalDayStreak.value   = d['total_day_streak'] ?? 0;

    /// Save to USER SharedPreferences
    await _prefs.setInt(CommonData.id, id.value);
    await _prefs.setString(CommonData.application, application.value);
    await _prefs.setString(CommonData.role, role.value);
    await _prefs.setString(CommonData.name, name.value);
    await _prefs.setString(CommonData.email, email.value);
    await _prefs.setString(CommonData.profileImage, profileImage.value);
    await _prefs.setString(CommonData.googleImageUrl, googleImageUrl.value);
    await _prefs.setString(CommonData.facebookId, facebookId.value);
    await _prefs.setString(CommonData.facebookImageUrl, facebookImageUrl.value);
    await _prefs.setInt(CommonData.age, age.value);
    await _prefs.setString(CommonData.location, location.value);
    await _prefs.setString(CommonData.bio, bio.value);
    await _prefs.setString(CommonData.ethnicity, ethnicity.value);
    await _prefs.setString(CommonData.gender, gender.value);
    await _prefs.setString(CommonData.sexualOrientation, sexualOrientation.value);
    await _prefs.setStringList(CommonData.neurotypes, neurotypes);
    await _prefs.setString(CommonData.profession, profession.value);
    await _prefs.setString(CommonData.socialMediaLink, socialMediaLink.value);
    await _prefs.setString(CommonData.interestsAndProjects, interestsAndProjects.value);
    await _prefs.setString(CommonData.anythingElse, anythingElse.value);
    await _prefs.setBool(CommonData.isSubscribed, isSubscribed.value);
    await _prefs.setString(CommonData.subscriptionType, subscriptionType.value);
    await _prefs.setString(CommonData.subscriptionStart, subscriptionStart.value);
    await _prefs.setString(CommonData.subscriptionEnd, subscriptionEnd.value);
    await _prefs.setString(CommonData.dateJoined, dateJoined.value);
    await _prefs.setString(CommonData.lastLogin, lastLogin.value);
    await _prefs.setInt(CommonData.totalEventJoin, totalEventJoin.value);
    await _prefs.setInt(CommonData.totalWalk, totalWalk.value);
    await _prefs.setInt(CommonData.totalDayStreak, totalDayStreak.value);
  }







  /// -------- USER GET --------------
  Future<void> getUserData() async {
    _prefs = await SharedPreferences.getInstance();

    id.value               = _prefs.getInt(CommonData.id) ?? 0;
    application.value      = _prefs.getString(CommonData.application) ?? "";
    role.value             = _prefs.getString(CommonData.role) ?? "";
    name.value             = _prefs.getString(CommonData.name) ?? "";
    email.value            = _prefs.getString(CommonData.email) ?? "";
    profileImage.value     = _prefs.getString(CommonData.profileImage) ?? "";
    googleImageUrl.value   = _prefs.getString(CommonData.googleImageUrl) ?? "";
    facebookId.value       = _prefs.getString(CommonData.facebookId) ?? "";
    facebookImageUrl.value = _prefs.getString(CommonData.facebookImageUrl) ?? "";
    age.value              = _prefs.getInt(CommonData.age) ?? 0;
    location.value         = _prefs.getString(CommonData.location) ?? "";
    bio.value              = _prefs.getString(CommonData.bio) ?? "";
    ethnicity.value        = _prefs.getString(CommonData.ethnicity) ?? "";
    gender.value           = _prefs.getString(CommonData.gender) ?? "";
    sexualOrientation.value= _prefs.getString(CommonData.sexualOrientation) ?? "";
    neurotypes.value       = _prefs.getStringList(CommonData.neurotypes) ?? [];
    profession.value       = _prefs.getString(CommonData.profession) ?? "";
    socialMediaLink.value  = _prefs.getString(CommonData.socialMediaLink) ?? "";
    interestsAndProjects.value = _prefs.getString(CommonData.interestsAndProjects) ?? "";
    anythingElse.value     = _prefs.getString(CommonData.anythingElse) ?? "";
    isSubscribed.value     = _prefs.getBool(CommonData.isSubscribed) ?? false;
    subscriptionType.value = _prefs.getString(CommonData.subscriptionType) ?? "";
    subscriptionStart.value= _prefs.getString(CommonData.subscriptionStart) ?? "";
    subscriptionEnd.value  = _prefs.getString(CommonData.subscriptionEnd) ?? "";
    dateJoined.value       = _prefs.getString(CommonData.dateJoined) ?? "";
    lastLogin.value        = _prefs.getString(CommonData.lastLogin) ?? "";
    totalEventJoin.value   = _prefs.getInt(CommonData.totalEventJoin) ?? 0;
    totalWalk.value        = _prefs.getInt(CommonData.totalWalk) ?? 0;
    totalDayStreak.value   = _prefs.getInt(CommonData.totalDayStreak) ?? 0;
  }






  updateProfileImage(String profileImageD)async{
    _prefs = await SharedPreferences.getInstance();
    profileImage.value=profileImageD;
    _prefs.setString(CommonData.profileImage, profileImageD);
  }

}