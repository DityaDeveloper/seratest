// ignore_for_file: avoid_print, avoid_single_cascade_in_expression_statements

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:seratest/data/model/category/category_model.dart';
import 'package:seratest/domain/repositories/remote/product/product_repo.dart';

class HomeProductFilterController extends GetxController
    with StateMixin<List<CategoryModel>> {
  final productRepository = ProductRepository();
  List<CategoryModel> datalist = [];

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  Future<List<CategoryModel>> getCategory() async {
    change(null, status: RxStatus.loading());
    final response = await productRepository.getProductCategoryList();
    if (response.isNotEmpty) {
      debugPrint(response.toString());
      change(response, status: RxStatus.success());
      datalist = response;
      datalist.add(const CategoryModel(categoryname: 'all'));
      datalist.sort((a, b) => a.categoryname.compareTo(b.categoryname));
      return response;
    }
    change(response, status: RxStatus.empty());
    return [];
  }
}
