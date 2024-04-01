import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seratest/app/routes/route_name.dart';
import 'package:seratest/data/model/product/product_model.dart';
import 'package:seratest/domain/repositories/remote/product/product_repo.dart';

class HomeController extends GetxController {
  final productRepository = ProductRepository();
   final boxStorage = GetStorage();

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  gotoSearch() {
    Get.toNamed(RoutesName.searchproduct);
  }
  gotoCart() {
    Get.toNamed(RoutesName.cartproduct);
  }

  addProductToCart({required ProductModel productModel}) async {
    List productlist = [];
    productlist.add(productModel);
    Map requestBody = {
      'userId': boxStorage.read('uid'),
      'date': '2020-02-03',
      'products': productlist
    };
    print(requestBody);
    var response = await productRepository.addToCart(requestBody);
    if (response == true) {
      Get.snackbar('Success', 'Added to your cart');
      Get.toNamed(RoutesName.home);
    } else {
      Get.snackbar('Failed', 'Product not added');
    }
  }
}
