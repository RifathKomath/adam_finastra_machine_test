import 'package:adam_finastra_machinetest/app/controller/home/home_controller.dart';
import 'package:adam_finastra_machinetest/app/view/profile/profile_view.dart';
import 'package:adam_finastra_machinetest/config.dart';
import 'package:adam_finastra_machinetest/shared/utils/screen_utils.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_loader.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/extensions/margin_extension.dart';
import '../../../core/style/app_text_style.dart';
import '../../../core/style/colors.dart';
import 'widgets/category_container.dart';
import 'widgets/course_card.dart';
import 'widgets/live_container.dart';
import 'widgets/tutor_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeAppBar(title: userLoginedData?.name),
              // body >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return AppLoader();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // categories >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      Text(
                        "Categories",
                        style: AppTextStyles.textStyle_700_14.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      15.h.hBox,
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categoryList.length,
                          itemBuilder: (context, index) {
                            final category = controller.categoryList[index];
                            final sub = category.subcategories?.first;
                            return HomeCategoryCard(
                              image: sub?.image ?? "",
                              title: category.name ?? "",
                              count: "${category.courseCount} Courses",
                              subTitle: sub?.name ?? "",
                            );
                          },
                        ),
                      ),
                      // live session >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      15.h.hBox,
                      Text(
                        "Live Session",
                        style: AppTextStyles.textStyle_700_14.copyWith(
                          fontSize: 17,
                        ),
                      ),

                      controller.sessionList.isNotEmpty
                          ? LiveSessionCard(
                              tutorName:
                                  controller.sessionList.first.tutor?.name ??
                                  "",
                              topic: controller.sessionList.first.topic ?? "",
                              profileImage:
                                  controller
                                      .sessionList
                                      .first
                                      .tutor
                                      ?.profilePicture ??
                                  "",
                              onJoin: () {
                                controller.joinMeeting(
                                  controller.sessionList.first.meetingUrl,
                                );
                              },
                            )
                          : noLiveContainer(),

                      // Popular Courses >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      15.h.hBox,
                      Text(
                        "Popular Courses",
                        style: AppTextStyles.textStyle_700_14.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      15.h.hBox,
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.popularCourseList.length,
                          separatorBuilder: (_, __) => SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            final course = controller.popularCourseList[index];
                            return CourseCard(
                              imageUrl: course.courseImage ?? "",
                              courseName: course.courseName ?? "",
                              price: course.price ?? 0,
                              offerPrice: course.offerPrice ?? 0,
                              tutorImageUrl: course.tutor?.profilePicture ?? "",
                              tutorName: course.tutor?.name ?? "",
                              rating: course.rating ?? 0,
                              reviewCount: course.reviewCount ?? 0,
                            );
                          },
                        ),
                      ),
                      // Top Tutors >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      15.h.hBox,
                      Text(
                        "Top Tutors",
                        style: AppTextStyles.textStyle_700_14.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      15.h.hBox,
                      SizedBox(
                        height: 130,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.tutorList.length,
                          itemBuilder: (context, index) {
                            final tutor = controller.tutorList[index];
                            return TutorCard(
                              image: tutor.profilePicture ?? "",
                              name: tutor.name ?? "",
                              specialization: tutor.specialization ?? "",
                              courseCount: tutor.courseCount ?? 0,
                              studentCount: tutor.studentCount ?? 0,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHomeAppBar extends StatelessWidget {
  final String? title;
  const CustomHomeAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
                12.wBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Welcome! 👋', style: AppTextStyles.textStyle_500_14),
                    2.hBox,
                    Text(title ?? "", style: AppTextStyles.textStyle_600_14),
                  ],
                ),
                Spacer(),
                AppSvg.clickable(
                  assetName: "user_icon",
                  onPressed: () {
                    Screen.open(ProfileView());
                  },
                  width: 26,
                ),
              ],
            ),
          ),
          Container(width: double.infinity, height: 1, color: dividerGreyClr),
        ],
      ),
    );
  }
}

Widget noLiveContainer() {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      color: whiteClr,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text("No live sessions available"),
    ),
  );
}
