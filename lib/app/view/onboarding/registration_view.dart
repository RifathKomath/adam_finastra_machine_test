import 'package:adam_finastra_machinetest/app/controller/onboarding/onboarding_controller.dart';
import 'package:adam_finastra_machinetest/app/view/onboarding/otp_verification_view.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:adam_finastra_machinetest/shared/utils/screen_utils.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_bar.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_button.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../../core/extensions/margin_extension.dart';
import '../../../shared/utils/choice_chip.dart';
import '../../../shared/utils/country_code.dart';
import '../../../shared/utils/validators.dart';
import '../../../shared/widgets/app_toast.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      appBar: commonAppBar(title: "Register your details", context: context,centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  controller: controller.fullNameCntrl,
                  textInputType: TextInputType.name,
                  labelText: "Enter your full name",
                  useHintInsteadOfLabel: true,
                  label: "Full Name",
                  textCapitalization: TextCapitalization.words,
                  isRequired: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                    FilteringTextInputFormatter.deny(RegExp(r'[^\sa-zA-Z]')),
                  ],
                  validator: AppValidators.required,
                ),
                15.h.hBox,
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
                15.h.hBox,
                Obx(
                  () => AppTextField(
                    controller: controller.passwordCntrl,
                    textInputType: TextInputType.visiblePassword,
                    labelText: "Enter your Password",
                    useHintInsteadOfLabel: true,
                    obscureText: !controller.isPasswordVisible.value,
                    label: "Password",
                    isRequired: true,
                    max: 1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: darkGrey,
                        size: 23,
                      ),
                      onPressed: () {
                        controller.isPasswordVisible.toggle();
                      },
                    ),
                  ),
                ),
                15.h.hBox,
                Obx(
                  () => AppTextField(
                    controller: controller.confirmPasswordCntrl,
                    textInputType: TextInputType.visiblePassword,
                    labelText: "Confirm your Password",
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    useHintInsteadOfLabel: true,
                    max: 1,
                    label: "Confirm Password",
                    isRequired: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm Password is required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      } else if (value != controller.passwordCntrl.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: darkGrey,
                        size: 23,
                      ),
                      onPressed: () {
                        controller.isConfirmPasswordVisible.toggle();
                      },
                    ),
                  ),
                ),

                15.h.hBox,
                customRichText(title: "Phone Number"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => SizedBox(
                        width: 90.w,
                        child: CountryCodeDropdown(
                          value: controller.countryCode.value,
                          onChanged: (val) {
                            controller.countryCode.value = val;
                          },
                        ),
                      ),
                    ),

                    8.wBox,
                    Expanded(
                      child: AppTextField(
                        controller: controller.phoneNoCntrl,
                        textInputType: TextInputType.number,
                        labelText: "Enter your Phone Number",
                        useHintInsteadOfLabel: true,
                        isRequired: true,
                        maxLength: 10,
                        validator: AppValidators.required,
                      ),
                    ),
                  ],
                ),
                10.h.hBox,
                customRichText(title: "Gender"),
                8.h.hBox,
                Obx(
                  () => CustomChoiceChipRow(
                    options: ['Male', 'Female', 'Others'],
                    height: 48,
                    selectedValue: controller.gender.value,
                    onSelected: (val) => controller.gender.value = val,
                    alignment: MainAxisAlignment.start,
                    isExpanded: true,
                  ),
                ),
                15.h.hBox,
                AppTextField(
                  controller: controller.dobCntrl,
                  textInputType: TextInputType.visiblePassword,
                  labelText: "Click the calendar",
                  useHintInsteadOfLabel: true,
                  label: "Date Of Birth",
                  isRequired: true,
                  readOnly: true,
                  validator: AppValidators.required,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_month, color: darkGrey, size: 23),
                    onPressed: () => controller.pickDob(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Obx(
          () => AppButton(
            isLoaderBtn: controller.isLoading.value,
            label: "Register",
            onTap: () {
              if (controller.formKey.currentState!.validate()) {
                if (controller.gender.value.isEmpty) {
                  showToast("Please select Gender");
                  return;
                }
                if (controller.passwordCntrl.text !=
                    controller.confirmPasswordCntrl.text) {
                  showToast("Passwords should be same");
                  return;
                }

                controller.register(context: context);
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget customRichText({required String title}) {
  return RichText(
    text: TextSpan(
      text: title,
      style: AppTextStyles.textStyle_500_14.copyWith(color: Colors.black),
      children: [
        TextSpan(
          text: ' *',
          style: TextStyle(color: Colors.red),
        ),
      ],
    ),
  );
}
