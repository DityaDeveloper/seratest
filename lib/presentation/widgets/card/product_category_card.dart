import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seratest/data/model/category/category_model.dart';
import 'package:seratest/presentation/features/home_product/home_product_controller.dart';

class ProductCategoryCard extends StatelessWidget {
  const ProductCategoryCard({super.key, required this.datalist});
  final List<CategoryModel> datalist;
  @override
  Widget build(BuildContext context) {
    final homeproductCtrl = Get.find<HomeProductController>();
    return SizedBox(
     height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: datalist.length,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(child: GestureDetector(
              onTap: () {
                 homeproductCtrl.filterProduct(datalist[index].categoryname);
              },
              child: Text(datalist[index].categoryname))),
          ),
        ),
      ),
    );
  }
}
