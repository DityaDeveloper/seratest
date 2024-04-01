import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seratest/data/model/product/product_model.dart';
import 'package:seratest/domain/repositories/remote/product/product_repo.dart';

class ProductCartController extends GetxController
    with StateMixin<List<ProductModel>> {
  final productRepository = ProductRepository();
  List<ProductModel> datalist = [];
  final boxStorage = GetStorage();

   
  @override
  void onInit() {
    getProductCart();
    super.onInit();
  }

  @override
  void onClose() {
    //
    datalist.clear();
    super.onClose();
  }


  Future<List<ProductModel>> getProductCart() async {
    change(null, status: RxStatus.loading());
    final response = await productRepository.getProductCartList(boxStorage.read('uid'));
    if (response.isNotEmpty) {
      debugPrint(response.toString());
      change(response, status: RxStatus.success());
      datalist = response;
      return response;
    }
    change(response, status: RxStatus.empty());
    return [];
  }
}
