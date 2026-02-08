import 'package:adam_finastra_machinetest/app/view/home/home_view.dart';
import 'package:adam_finastra_machinetest/app/view/onboarding/registration_view.dart';
import 'package:adam_finastra_machinetest/config.dart';
import 'package:adam_finastra_machinetest/core/service/shared_pref.dart';
import 'package:adam_finastra_machinetest/shared/utils/screen_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/animation.dart';

import '../../view/onboarding/login_view.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    scaleAnimation = Tween<double>(begin: 0.100, end: 1.1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () async {

          userLoginedData = await SharedPref().getLoginedUserData();
          accessToken = await SharedPref().loadAccessToken();
          if (userLoginedData != null) {
            Screen.openAsNewPage(HomeView());
          } else { 
            Screen.openAsNewPage(RegistrationView());
          }
        });
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
