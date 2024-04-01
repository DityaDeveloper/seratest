import 'package:get/get.dart';
import 'package:seratest/presentation/features/home/home_controller.dart';
import 'package:seratest/presentation/features/home_product/home_product_controller.dart';
import 'package:seratest/presentation/features/home_product_search/home_product_search_controller.dart';
import 'package:seratest/presentation/features/login/login_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeProductSearchController());
    Get.put(HomeProductController(), permanent: true);
    
  }
}