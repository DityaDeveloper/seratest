// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:seratest/presentation/widgets/card/product_card_listitle_shimmer.dart';
import 'package:seratest/presentation/widgets/card/product_card_listtile.dart';

import 'home_product_search_controller.dart';

class HomeProductSearchView extends GetView<HomeProductSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child:  TextField(
                controller: controller.searchTextController,
                onChanged: (value) {
                  controller.searchProduct(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: GestureDetector(
                    onTap: controller.resetSearchText,
                    child: const Icon(Icons.close)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            controller.obx(
              (state) => ProductCardListtile(datalist: state!),
              onEmpty: const Text(
                "No Product",
                style: TextStyle(color: Colors.white),
              ),
              onLoading: const ProductCardListtileShimmer(),
            ),
          ],
        ));
  }
}
