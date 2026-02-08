import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveSessionCard extends StatelessWidget {
  final String tutorName;
  final String topic;
  final String profileImage;
  final VoidCallback onJoin;

  const LiveSessionCard({
    super.key,
    required this.tutorName,
    required this.topic,
    required this.profileImage,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              profileImage,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
          ),

          12.w.wBox,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tutorName,
                  style: AppTextStyles.textStyle_600_14.copyWith(fontSize: 15),
                ),
                2.h.hBox,
                Text(
                  topic,
                  style: AppTextStyles.textStyle_400_14.copyWith(
                    color: grey2Clr,
                  ),
                ),
               
              ],
            ),
          ),

          AppButton(label: "Join", onTap: onJoin, height: 40),
        ],
      ),
    );
  }
}
