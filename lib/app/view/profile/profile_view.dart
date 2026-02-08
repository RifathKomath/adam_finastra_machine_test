import 'package:adam_finastra_machinetest/app/view/profile/profile_edit_dialog.dart';
import 'package:adam_finastra_machinetest/config.dart';
import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_bar.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/style/colors.dart';
import '../../controller/profile/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
        final ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      appBar: commonAppBar(
        title: "Profile View",
        context: context,
        isBack: true,
        centerTitle: true,
      ),
      body: Column(
        children: [
          20.h.hBox,
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 55.r,
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
          ),
          10.h.hBox,
          Text(
            userLoginedData?.name ?? "",
            style: AppTextStyles.textStyle_700_14.copyWith(fontSize: 20),
          ),
          5.h.hBox,
          Text(
            "ID : ${userLoginedData?.id ?? ""}",
            style: AppTextStyles.textStyle_400_14,
          ),
          30.h.hBox,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: dividerGreyClr,
                borderRadius: BorderRadius.circular(8),
              ),

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: AppSvg.clickable(
                        assetName: "edit_icon",
                        onPressed: () {
                          controller.dataBinding();
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return ProfileEditDialog();
                            },
                          );
                        },
                        color: blackText,
                        height: 15,
                      ),
                    ),
                    15.h.hBox,
                    customContainer(
                      key: "Email :",
                      value: userLoginedData?.email ?? "",
                    ),
                    15.h.hBox,
                    customContainer(
                      key: "Phone Number :",
                      value:
                          "${userLoginedData?.dialCode ?? ""} ${userLoginedData?.phone ?? ""}",
                    ),
                    15.h.hBox,
                    customContainer(
                      key: "Gender :",
                      value: userLoginedData?.gender ?? "",
                    ),
                    15.h.hBox,
                    customContainer(
                      key: "Date Of Birth :",
                      value: userLoginedData?.dateOfBirth != null
                          ? DateFormat(
                              "dd-MM-yyyy",
                            ).format(userLoginedData!.dateOfBirth!)
                          : "N/A",
                    ),
                    15.h.hBox,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget customContainer({required String key, required String value}) {
  return Container(
    decoration: BoxDecoration(
      color: whiteClr,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              key,
              style: AppTextStyles.textStyle_400_14.copyWith(
                fontSize: 16,
                color: darkGrey,
              ),
            ),
          ),
          Text(
            value,
            style: AppTextStyles.textStyle_400_14.copyWith(
              fontSize: 16,
              color: blackText,
            ),
          ),
        ],
      ),
    ),
  );
}
