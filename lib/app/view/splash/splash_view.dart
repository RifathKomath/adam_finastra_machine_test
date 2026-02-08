import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (_, child) {
            return Opacity(
              opacity: controller.opacityAnimation.value,
              child: Transform.scale(
                scale: controller.scaleAnimation.value,
                child: child,
              ),
            );
          },
          child: Text(
            "Adam Finastra",
            style: AppTextStyles.textStyle_700_14.copyWith(
              fontSize: 38,
              fontFamily: "poppins",
              color: darkPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
