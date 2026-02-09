import 'package:adam_finastra_machinetest/core/extensions/margin_extension.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/app_bar.dart';
import '../../model/home/home_data_response.dart';
import 'widgets/sub_category_card.dart';

class SubCategoryView extends StatelessWidget {
  final String title;
  final List<Subcategory> subCategories;

  const SubCategoryView({
    super.key,
    required this.title,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: title,
        context: context,
        centerTitle: true,
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: subCategories.length,
          separatorBuilder: (context, index) {
            return 15.hBox;
          },
          itemBuilder: (context, index) {
            final sub = subCategories[index];
            return Hero(
              tag: sub.name ?? "",
              child: Material(
                color: Colors.transparent,
                child: SubCategoryCard(
                  image: sub.image ?? "",
                  title: sub.name ?? "",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
