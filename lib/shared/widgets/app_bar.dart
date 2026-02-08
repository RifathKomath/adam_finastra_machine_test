import 'package:flutter/material.dart';

import '../../core/style/app_text_style.dart';
import '../../core/style/colors.dart';
import '../utils/screen_utils.dart';

PreferredSizeWidget commonAppBar({
  required String title,
  bool? isBack,
  bool? centerTitle,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: whiteClr,
    iconTheme: const IconThemeData(color: Colors.black),

    title: Text(
      title,
      style: AppTextStyles.textStyle_700_14.copyWith(fontSize: 16),
    ),
    centerTitle: centerTitle,
    automaticallyImplyLeading: isBack ?? false,
    leading: isBack == true
        ? GestureDetector(
            onTap: () => Screen.close(),
            child: const Icon(Icons.arrow_back_outlined),
          )
        : null,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(2),
      child: Container(
        width: double.infinity,
        height: 1,
        color: dividerGreyClr,
      ),
    ),
    forceMaterialTransparency: true,
  );
}
