import 'package:adam_finastra_machinetest/app/controller/onboarding/onboarding_controller.dart';
import 'package:adam_finastra_machinetest/app/view/onboarding/login_view.dart';
import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:adam_finastra_machinetest/shared/utils/screen_utils.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_bar.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../shared/widgets/app_text_field.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();
    return Scaffold(
      appBar: commonAppBar(title: "verify OTP", context: context,centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.otpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.hBox,
              AppTextField(
                controller: controller.emailCntrl,
                textInputType: TextInputType.emailAddress,
                labelText: "Enter your Email",
                label: "Email",
                useHintInsteadOfLabel: true,
                isRequired: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Field is required";
                  }
                  final emailRegex = RegExp(
                    r'^[\w\.\-]+@[a-zA-Z0-9\-]+\.(com)$',
                  );

                  if (!emailRegex.hasMatch(value.trim())) {
                    return "Enter a valid email (example@gmail.com)";
                  }

                  return null;
                },
              ),
              25.h.hBox,
              PinCodeTextField(
                appContext: context,
                length: 6,
                keyboardType: TextInputType.none,
                cursorColor: Colors.black,
                controller: controller.otpCntl,
                textStyle: AppTextStyles.textStyle_600_14.copyWith(
                  color: blackText,
                  fontSize: 20,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 54,
                  fieldWidth: 44,

                  activeColor: darkPrimary,
                  selectedColor: darkPrimary,
                  inactiveColor: darkPrimary,

                  activeFillColor: const Color.fromARGB(255, 241, 241, 243),
                  selectedFillColor: const Color.fromARGB(255, 241, 241, 243),
                  inactiveFillColor: const Color.fromARGB(255, 241, 241, 243),
                ),
                enableActiveFill: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Obx(
          () => AppButton(
            isLoaderBtn: controller.isLoading.value,
            label: "Verify OTP",
            onTap: () {
              if (controller.otpFormKey.currentState!.validate()) {
                controller.verifyOtp(context: context);
              }
            },
          ),
        ),
      ),
    );
  }
}
