import 'package:adam_finastra_machinetest/app/model/onboarding/login_request.dart';
import 'package:adam_finastra_machinetest/app/model/onboarding/login_response.dart';
import 'package:adam_finastra_machinetest/app/model/onboarding/otp_verify_request.dart';
import 'package:adam_finastra_machinetest/app/model/onboarding/register_request.dart';
import 'package:adam_finastra_machinetest/app/model/onboarding/register_response.dart';
import 'package:adam_finastra_machinetest/app/view/home/home_view.dart';
import 'package:adam_finastra_machinetest/app/view/onboarding/login_view.dart';
import 'package:adam_finastra_machinetest/app/view/onboarding/otp_verification_view.dart';
import 'package:adam_finastra_machinetest/core/service/api.dart';
import 'package:adam_finastra_machinetest/core/service/shared_pref.dart';
import 'package:adam_finastra_machinetest/core/service/urls.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:adam_finastra_machinetest/shared/utils/screen_utils.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_success_dialog.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../../model/onboarding/otp_verify_response.dart';

class OnboardingController extends GetxController {
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameCntrl = TextEditingController();
  final TextEditingController emailCntrl = TextEditingController();
  final TextEditingController passwordCntrl = TextEditingController();
  final TextEditingController confirmPasswordCntrl = TextEditingController();
  final TextEditingController phoneNoCntrl = TextEditingController();
  final TextEditingController dobCntrl = TextEditingController();
  RxString countryCode = "+91".obs;
  RxString gender = ''.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  Future<void> pickDob(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: darkPrimary,
              onPrimary: Colors.white,
              onSurface: darkPrimary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: darkPrimary),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      dobCntrl.text =
          "${pickedDate.day.toString().padLeft(2, '0')}-"
          "${pickedDate.month.toString().padLeft(2, '0')}-"
          "${pickedDate.year}";
    }
  }

  Rxn<User> userData = Rxn<User>();
  void register({required BuildContext context}) async {
    final inputDob = dobCntrl.text;
    final parsedDob = DateTime.parse(
      DateFormat('dd-MM-yyyy').parse(inputDob).toIso8601String(),
    );
    try {
      isLoading.value = true;
      final requestBody = RegisterRequest(
        name: fullNameCntrl.text,
        email: emailCntrl.text,
        password: passwordCntrl.text,
        confirmPassword: confirmPasswordCntrl.text,
        dialCode: countryCode.value,
        phone: phoneNoCntrl.text,
        gender: gender.value,
        dateOfBirth: parsedDob,
        profilePicture: "",
        profilePictureFile: "",
      );
      final response = await Api.call(
        endPoint: registerUrl,
        method: Method.post,
        body: requestBody.toJson(),
      );
      if (response.success) {
        final result = RegisterResponse.fromJson(response.response).user;
        await SharedPref().save(key: "userdata", value: result?.toJson());
        await SharedPref().getUserData();
        SuccessDialog.show(
          context,
          message: "Registered Successfully",
          onComplete: () {
            Screen.openClosingCurrent(OtpVerificationView());
            otpCntl.text = result?.otp ?? "";
            passwordCntrl.text = "";
          },
        );
      } else {
        showToast(
          response.msg.isNotEmpty ? response.msg : "Error while registering",
        );
      }
    } catch (e) {
      print("Error while registering $e");
    } finally {
      isLoading.value = false;
    }
  }

  // otp >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  final TextEditingController otpCntl = TextEditingController();
  final otpFormKey = GlobalKey<FormState>();

  Rxn<OtpUser> verifyUserData = Rxn<OtpUser>();
  void verifyOtp({required BuildContext context}) async {
    ;
    try {
      isLoading.value = true;
      final requestBody = OtpRequest(email: emailCntrl.text, otp: otpCntl.text);
      final response = await Api.call(
        endPoint: verifyOtpUrl,
        method: Method.post,
        body: requestBody.toJson(),
      );
      if (response.msg == "OTP verified successfully") {
        final result = OtpResponse.fromJson(response.response).token;
        await SharedPref().saveAccessToken(result ?? "");
        await SharedPref().loadAccessToken();
        SuccessDialog.show(
          context,
          message: "OTP Verified Successfully",
          onComplete: () {
            Screen.openClosingCurrent(LoginView());
          },
        );
      } else {
        showToast(
          response.msg.isNotEmpty ? response.msg : "Error while verifying",
        );
      }
    } catch (e) {
      print("Error while verifying $e");
    } finally {
      isLoading.value = false;
    }
  }

  // login >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  final loginFormKey = GlobalKey<FormState>();

  void login({required BuildContext context}) async {
    try {
      isLoading.value = true;
      final requestBody = LoginRequest(
        email: emailCntrl.text,
        password: passwordCntrl.text,
      );
      final response = await Api.call(
        endPoint: loginUrl,
        method: Method.post,
        body: requestBody.toJson(),
      );
      if (response.success) {
        final result = LoginResponse.fromJson(response.response);
        await SharedPref().save(key: "userlogdata", value: result.user?.toJson());
        await SharedPref().getLoginedUserData();
        await SharedPref().saveAccessToken(result.token ?? "");
        await SharedPref().loadAccessToken();
        SuccessDialog.show(
          context,
          message: "Logged in successfully",
          onComplete: () {
            Screen.openClosingCurrent(HomeView());
          },
        );
      } else {
        showToast(response.msg.isNotEmpty ? response.msg : "Error while login");
      }
    } catch (e) {
      print("Error while login $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    dobCntrl.dispose();
    super.onClose();
  }
}
