import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String courseName;
  final int price;
  final int offerPrice;
   final String tutorImageUrl;
   final String tutorName;
    final int rating;
  final int reviewCount;

  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.courseName,
    required this.price,
    required this.offerPrice,
    required this.tutorImageUrl,
    required this.tutorName,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.75), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              courseName,
              style: AppTextStyles.textStyle_600_14.copyWith(
                color: whiteClr,
                fontSize: 16,
              ),
            ),

            6.h.hBox,
             Text(
                  "Offer Price: ₹$offerPrice",
                  style: AppTextStyles.textStyle_700_14.copyWith(color: whiteClr)
                ),
               6.h.hBox,
                Text(
                  "Price: ₹$price",
                  style: AppTextStyles.textStyle_400_14.copyWith(color: whiteClr.withOpacity(0.75))
                ),

            8.h.hBox,

           
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    tutorImageUrl,
                  ),
                ),
               8.w.wBox,
                Expanded(
                  child: Text(
                  tutorName,
                    style:AppTextStyles.textStyle_500_14.copyWith(color: whiteClr),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              6.w.wBox,
                Row(
                  children: [
                     Icon(Icons.star, size: 14, color: Colors.amber),
                     3.w.wBox,
                    Text(
                      "$rating ($reviewCount)",
                      style: AppTextStyles.textStyle_400_14.copyWith(color: whiteClr.withOpacity(0.75))
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
