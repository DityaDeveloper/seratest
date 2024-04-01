// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/card/product_category_card.dart';
import '../../widgets/card/product_category_card_shimmer.dart';
import 'home_product_filter_controller.dart';

class HomeProductFilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeProductFilterController>(
      init: HomeProductFilterController(),
      builder: (controller) => controller.obx(
        (state) => ProductCategoryCard(datalist: controller.datalist),
        onEmpty: const Text(
          "No Product",
          style: TextStyle(color: Colors.white),
        ),
        onLoading: const ProductCategoryCardShimmer(),
      ),
    );
  }
}
