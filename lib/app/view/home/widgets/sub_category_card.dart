import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:adam_finastra_machinetest/core/style/app_text_style.dart';
import 'package:adam_finastra_machinetest/core/style/colors.dart';
import 'package:flutter/material.dart';

class SubCategoryCard extends StatelessWidget {
  final String image;
  final String title;

  const SubCategoryCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.15),
              Colors.black.withOpacity(0.65),
            ],
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: AppTextStyles.textStyle_600_14.copyWith(color: whiteClr),
        ),
      ),
    );
  }
}
