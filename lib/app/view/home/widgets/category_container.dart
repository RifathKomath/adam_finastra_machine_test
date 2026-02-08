import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:flutter/material.dart';

class HomeCategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String count;

  const HomeCategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Image.network(
              image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.45),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.textStyle_600_14.copyWith(
                          color: whiteClr,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        count,
                        style: AppTextStyles.textStyle_400_14.copyWith(
                          fontSize: 13,
                          color: whiteClr.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subTitle,
                        style: AppTextStyles.textStyle_700_14.copyWith(
                          fontSize: 12,
                          color: whiteClr,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: whiteClr,
                        size: 14,
                      ),
                    ],
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
