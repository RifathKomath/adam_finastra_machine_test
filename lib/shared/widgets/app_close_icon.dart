import 'package:adam_finastra_machinetest/shared/utils/screen_utils.dart';
import 'package:flutter/material.dart';

import '../../core/style/colors.dart';

class AppCloseIcon extends StatelessWidget {
  const AppCloseIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Screen.close();
      },
      child: Container(
        decoration: BoxDecoration(gradient: buttonColor,  borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.close,color: whiteClr,),
      ),
    );
  }
}