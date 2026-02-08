import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TutorCard extends StatelessWidget {
  final String image;
  final String name;
  final String specialization;
  final int courseCount;
  final int studentCount;
  final VoidCallback? onTap;

  const TutorCard({
    super.key,
    required this.image,
    required this.name,
    required this.specialization,
    required this.courseCount,
    required this.studentCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        height: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.65),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.textStyle_600_14.copyWith(
                      fontSize: 16,
                      color: whiteClr,
                    ),
                  ),
                  3.h.hBox,
                  Text(
                    specialization,
                    style: AppTextStyles.textStyle_400_14.copyWith(
                      color: whiteClr.withOpacity(0.75),
                    ),
                  ),
                  7.h.hBox,
                  Text(
                    "$courseCount Courses • $studentCount Students",
                    style: AppTextStyles.textStyle_400_14.copyWith(
                      color: whiteClr.withOpacity(0.75),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
