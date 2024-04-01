import 'package:get/get.dart';

import 'product_cart_controller.dart';

class ProductCartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductCartController());
  }
}