import 'dart:convert';

import 'package:get/get.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/prefs_helper.dart';
import 'package:netwalking_global/utils/app_constants.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';
import 'package:netwalking_global/views/screen/Auth/email_verification_screen.dart';
import 'package:netwalking_global/views/screen/Auth/otp_verify_screen.dart';
import 'package:netwalking_global/views/screen/Auth/reset_password_screen.dart';
import 'package:netwalking_global/views/screen/Home/home_screen.dart';
import 'package:netwalking_global/views/screen/SetUpProfile/set_up_profile_screen.dart';

import '../services/api_constant.dart';

class AuthController extends GetxController{


  var otp = "".obs;
  final isLoading = false.obs;
  final isOtpLoading = false.obs;
  final isLoginLoading = false.obs;
  final isSendOTPLoading = false.obs;
  final isEmailForgetLoading = false.obs;
  var isResetPassLoading = false.obs;

  final _dataController = Get.put(DataController());

  /// sign-up for client

  Future<void> signUp({required String email, required String password, required String confirmPassword}) async {

    isLoading(true);

    final body = {
      "application": "NG",
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
      "role": "user"
    };
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.signInEndPoint, jsonEncode(body),
        headers: headers);

    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(()=> EmailVerificationScreen(email: email));
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isLoading(false);

  }
  /// email otp verification
  Future<void> emailVerification({required String email}) async {

    isOtpLoading(true);

    final body = {
      "email": email,
      "otp": otp.value
    };

    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.emailVerificationEndPoint, jsonEncode(body),
        headers: headers);

    if(response.statusCode == 200){
      await PrefsHelper.setString(AppConstants.bearerToken, response.body['access_token']);
      showCustomSnackBar(response.body['message'], isError: false);

      Get.to(()=> SetUpProfileScreen());
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isOtpLoading(false);

  }

  /// login
  Future<void> login({required String email, required String password}) async {

    isLoginLoading(true);

    final body = {
      "email": email,
      "password": password
    };
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.loginEndPoint, jsonEncode(body),
        headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = response.body;
      await PrefsHelper.setString(AppConstants.bearerToken, json['access_token'] ?? '');
      await _dataController.setUserData(json['data'] ?? {});
      showCustomSnackBar(json['message'] ?? 'Login successful', isError: false);
      Get.to(()=> HomeScreen());
    } else {
      final error = response.body?['message'] ?? 'Unexpected error';
      showCustomSnackBar(error, isError: true);
    }

    isLoginLoading(false);
  }

  /// otp verification
  Future<void> sendOTPForForget({required String email}) async {

    isSendOTPLoading(true);

    final body = {
      "email": email
    };

    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.sendOtpEndPoint, jsonEncode(body),
        headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(()=> OtpVerifyScreen(email: email));
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isSendOTPLoading(false);

  }

  /// otp verify for change pass

  Future<void> emailForgetVerification({required String email}) async {

    isEmailForgetLoading(true);

    final body = {
      "email": email,
      "otp": otp.value
    };

    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.emailVerificationEndPoint, jsonEncode(body),
        headers: headers);

    if(response.statusCode == 200){
      await PrefsHelper.setString(AppConstants.bearerToken, response.body['access_token']);
      showCustomSnackBar(response.body['message'], isError: false);

      Get.to(()=> ResetPasswordScreen());
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isEmailForgetLoading(false);

  }

  /// reset password
  Future<void> resetPassword({required String password, required String confirmPassword}) async {

    isResetPassLoading(true);

    final body = {
      "password": password,
      "confirm_password": confirmPassword
    };

    final response = await ApiClient.postData(ApiConstant.resetPasswordEndPoint, jsonEncode(body));

    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.offAllNamed(AppRoutes.successfulScreen);
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isResetPassLoading(false);

  }

}

