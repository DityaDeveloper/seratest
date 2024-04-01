import 'package:get/get.dart';
import 'package:seratest/app/routes/route_name.dart';
import 'package:seratest/presentation/features/home/home_binding.dart';
import 'package:seratest/presentation/features/home_product_search/home_product_search_binding.dart';
import 'package:seratest/presentation/features/home_product_search/home_product_search_view.dart';
import 'package:seratest/presentation/features/product_cart/product_cart_binding.dart';
import 'package:seratest/presentation/features/product_cart/product_cart_view.dart';

import '../../presentation/features/home/home_view.dart';
import '../../presentation/features/login/login_binding.dart';
import '../../presentation/features/login/login_view.dart';

class RoutesPage {
  static final init = RoutesName.login;

  static final routes = [
    GetPage(
      name: RoutesName.login, 
      page: () => LoginView(),
      binding: LoginBinding(),
      ),
    GetPage(
      name: RoutesName.searchproduct, 
      page: () => HomeProductSearchView(),
      binding: HomeProductSearchBinding(),
      ),
    GetPage(
      name: RoutesName.home, 
      page: () => HomeView(),
      binding: HomeBinding(),
      ),
    GetPage(
      name: RoutesName.detailproduct, 
      page: () => HomeProductDetail(),
      binding: HomeBinding(),
      ),
    GetPage(
      name: RoutesName.cartproduct, 
      page: () => ProductCart(),
      binding: ProductCartBinding(),
      ),
    
  ];
}