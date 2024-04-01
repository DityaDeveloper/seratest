import 'package:get/get.dart';

import 'home_product_controller.dart';

class HomeProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeProductController());
  }
}