import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/home/home_data_response.dart';

class SubCourseView extends StatelessWidget {
  final PopularCourse course;
  const SubCourseView({super.key, required this.course});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: course.courseName ?? "",
        context: context,
        isBack: true,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: course.id ?? "",
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: Image.network(
                    course.courseImage ?? "",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              15.h.hBox,
              Text(
                course.courseName ?? "",
                style: AppTextStyles.textStyle_700_14.copyWith(fontSize: 20),
              ),
              8.h.hBox,
              Text(
                "Tutor: ${course.tutor?.name ?? ""}",
                style: AppTextStyles.textStyle_500_14.copyWith(color: grey2Clr),
              ),
              8.h.hBox,
              Text(
                "₹${course.offerPrice}  ",
                style: AppTextStyles.textStyle_600_14.copyWith(fontSize: 18),
              ),
              10.h.hBox,
              Text(
                "Lessons",
                style: AppTextStyles.textStyle_600_14.copyWith(fontSize: 18),
              ),
              10.h.hBox,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: course.lessons?.length ?? 0,
                separatorBuilder: (context, index) {
                  return 15.hBox;
                },
                itemBuilder: (context, index) {
                  final lesson = course.lessons![index];
                  return lessonCard(
                    lessonName: lesson.lessonName ?? "",
                    duration: lesson.duration ?? 0,
                    unit: lesson.unit ?? "",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget lessonCard({
  required String lessonName,
  required int duration,
  required String unit,
}) {
  return Container(
    decoration: BoxDecoration(
      color: whiteClr,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.30),
          blurRadius: 4,
          offset: const Offset(0, 0),
        ),
      ],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.play_circle_outline),
          10.w.wBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lessonName, style: AppTextStyles.textStyle_500_14),
              Text("$duration $unit", style: AppTextStyles.textStyle_500_14),
            ],
          ),
        ],
      ),
    ),
  );
}
