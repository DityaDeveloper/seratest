// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seratest/data/model/product/product_model.dart';
import 'package:seratest/presentation/features/home_product/home_product_controller.dart';

class HomeProductSearchController extends GetxController
    with StateMixin<List<ProductModel>> {
  List<ProductModel> datalist = [];
  List<ProductModel> searchdatalist = [];
  final searchTextController = TextEditingController();

  final productController = Get.find<HomeProductController>();

  @override
  void onInit() {
    //
    searchTextController.text = '';
    getProduct();
    super.onInit();
  }

  @override
  void onClose() {
    //
    searchTextController.dispose();
    searchTextController.clear();
    productController.dispose();
    super.onClose();
  }

  getProduct() async {
    change(null, status: RxStatus.loading());
    datalist = productController.datalist;
    change(datalist, status: RxStatus.success());
  }

  searchProduct(String query) {
    change(null, status: RxStatus.loading());
    searchdatalist = datalist
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(searchdatalist);
    change(searchdatalist, status: RxStatus.success());
  }

  resetSearchText() {
    change(null, status: RxStatus.loading());
    searchTextController.clear();
    searchdatalist = [];
    change(datalist, status: RxStatus.success());
  }
}
