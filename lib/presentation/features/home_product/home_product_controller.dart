// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:seratest/app/routes/route_name.dart';
import 'package:seratest/data/model/product/product_model.dart';
import 'package:seratest/domain/repositories/remote/product/product_repo.dart';

class HomeProductController extends GetxController
    with StateMixin<List<ProductModel>> {
  final productRepository = ProductRepository();
  List<ProductModel> datalist = [];
  List<ProductModel> filterdatalist = [];

  
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  @override
  void onClose() {
    //
    datalist.clear();
    filterdatalist.clear();
    super.onClose();
  }


  Future<List<ProductModel>> getProduct() async {
    change(null, status: RxStatus.loading());
    final response = await productRepository.getProductList();
    if (response.isNotEmpty) {
      debugPrint(response.toString());
    change(response, status: RxStatus.success());
    datalist = response;
      return response;
    }
    change(response, status: RxStatus.empty());
    return [];
  }

  filterProduct(String query) {
     change(null, status: RxStatus.loading());
    if(query == 'all'){
      change(datalist, status: RxStatus.success());
    } else{
      filterdatalist = datalist
        .where((item) => item.category.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(filterdatalist);
    change(filterdatalist, status: RxStatus.success());
    }
  }

  gotoDetailProduct({required ProductModel productModel}){
      Get.toNamed(RoutesName.detailproduct, arguments: productModel);
  }

}
