import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/extensions/margin_extension.dart';
import '../../../core/style/colors.dart';
import '../../../shared/utils/screen_utils.dart';
import '../../../shared/utils/validators.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../controller/onboarding/onboarding_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      appBar: commonAppBar(title: "Login", context: context,centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
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
                  validator: AppValidators.required,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Obx(
          () => AppButton(
            isLoaderBtn: controller.isLoading.value,
            label: "Login",
            onTap: () {
              if (controller.loginFormKey.currentState!.validate()) {
                controller.login(context: context);
              }
            },
          ),
        ),
      ),
    );
  }
}
