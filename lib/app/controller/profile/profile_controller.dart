import 'package:adam_finastra_machinetest/app/model/profile/update_request.dart';
import 'package:adam_finastra_machinetest/app/view/profile/profile_view.dart';
import 'package:adam_finastra_machinetest/shared/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../../../config.dart';
import '../../../core/service/api.dart';
import '../../../core/service/shared_pref.dart';
import '../../../core/service/urls.dart';
import '../../../core/style/colors.dart';
import '../../../shared/widgets/app_success_dialog.dart';
import '../../../shared/widgets/app_toast.dart';
import '../../model/onboarding/login_response.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameCntrl = TextEditingController();
  final TextEditingController emailCntrl = TextEditingController();
  final TextEditingController phoneNoCntrl = TextEditingController();
  final TextEditingController dobCntrl = TextEditingController();
  RxString countryCode = "+91".obs;
  RxString gender = ''.obs;

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

  void dataBinding() {
    fullNameCntrl.text = userLoginedData?.name ?? "";
    emailCntrl.text = userLoginedData?.email ?? "";
    phoneNoCntrl.text = userLoginedData?.phone ?? "";
    countryCode.value = userLoginedData?.dialCode ?? "+91";
    gender.value = userLoginedData?.gender ?? "";
    dobCntrl.text = userLoginedData?.dateOfBirth != null
        ? DateFormat("dd-MM-yyyy").format(userLoginedData!.dateOfBirth!)
        : "";
  }

  void updateProfile({required BuildContext context}) async {
    try {
      isLoading.value = true;
      final inputDob = dobCntrl.text;
      final parsedDob = DateTime.parse(
        DateFormat('dd-MM-yyyy').parse(inputDob).toIso8601String(),
      );
      final requestBody = UpdateProfileRequest(
        name: fullNameCntrl.text,
        email: emailCntrl.text,
        dialCode: countryCode.value,
        phone: phoneNoCntrl.text,
        gender: gender.value,
        dateOfBirth: parsedDob,
        profilePicture: "",
      );
      final response = await Api.call(
        endPoint: updateProfileUrl,
        method: Method.put,
        body: requestBody.toJson(),
      );
      if (response.success) {
        final result = LoginResponse.fromJson(response.response);
        await SharedPref().save(key: "userlogdata", value: result.user?.toJson());
        await SharedPref().getLoginedUserData();
        SuccessDialog.show(
          context,
          message: "Profile Updated successfully",
          onComplete: () {
            Screen.close();
           Screen.openClosingCurrent(ProfileView());
          },
        );
      } else {
        showToast(response.msg.isNotEmpty ? response.msg : "Error while updating profile");
      }
    } catch (e) {
      print("Error while updating profile $e");
    } finally {
      isLoading.value = false;
    }
  }
}
