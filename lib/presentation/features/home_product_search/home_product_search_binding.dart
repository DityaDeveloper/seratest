import 'package:get/get.dart';
import 'package:seratest/presentation/features/home_product/home_product_controller.dart';

import '../home/home_controller.dart';
import 'home_product_search_controller.dart';

class HomeProductSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeProductSearchController());
    Get.put(HomeProductController());
    Get.lazyPut(() => HomeController());
  }
}