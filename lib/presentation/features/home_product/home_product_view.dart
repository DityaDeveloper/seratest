// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seratest/presentation/features/home_product/home_product_controller.dart';
import 'package:seratest/presentation/widgets/card/product_card.dart';

import '../../widgets/card/product_card_shimmer.dart';

class HomeProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeProductController>(
      init: HomeProductController(),
      builder: (controller) => controller.obx(
        (state) =>  ProductCard(data: state!, homectrl: controller,),
        onEmpty: const Text(
          "No Product",
          style: TextStyle(color: Colors.white),
        ),
        onLoading: const ProductCardShimmer(),
      ),
    );
  }
}
