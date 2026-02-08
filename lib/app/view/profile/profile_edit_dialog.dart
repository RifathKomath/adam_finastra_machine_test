import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_button.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_close_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../shared/utils/choice_chip.dart';
import '../../../shared/utils/country_code.dart';
import '../../../shared/utils/validators.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/app_toast.dart';
import '../../controller/profile/profile_controller.dart';
import '../onboarding/registration_view.dart';

class ProfileEditDialog extends StatelessWidget {
  const ProfileEditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
    return Dialog(
      insetPadding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      backgroundColor: whiteClr,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Edit Profile",
                      style: AppTextStyles.textStyle_700_14.copyWith(fontSize: 20),
                    ),
                    AppCloseIcon(),
                  ],
                ),
                20.h.hBox,
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
                    final emailRegex = RegExp(r'^[\w\.\-]+@[a-zA-Z0-9\-]+\.(com)$');
            
                    if (!emailRegex.hasMatch(value.trim())) {
                      return "Enter a valid email (example@gmail.com)";
                    }
            
                    return null;
                  },
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
                        labelText: "Enter Number",
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
                25.h.hBox,
                Obx(()=>
                  AppButton(
                    isLoaderBtn: controller.isLoading.value,
                    label: "Save", onTap: () {
                  
                    if(controller.formKey.currentState!.validate()){
                     controller.updateProfile(context: context);
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
