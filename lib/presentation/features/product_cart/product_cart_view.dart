// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seratest/presentation/widgets/card/product_cart_card.dart';
import 'package:seratest/presentation/widgets/card/product_cart_shimmer.dart';

import 'product_cart_controller.dart';

class ProductCart extends GetView<ProductCartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            controller.obx(
              (state) => ProductCartListtile(datalist: state!),
              onEmpty: const Text(
                "No Product",
                style: TextStyle(color: Colors.white),
              ),
              onLoading: const ProductCartListtileShimmer(),
            ),
          ],
        ));
  }
}
