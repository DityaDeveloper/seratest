import 'package:flutter/foundation.dart';
import 'package:seratest/app/helper/network/client_api.dart';

import '../../../app/utils/constant/uri/fakestore/fakestore_url.dart';

class ProductDatasource {

  Future<dynamic> addcart(Map requestBody) async {
    String pathUrl = FakeStoreUrl.fakestorepath.carts;
    debugPrint("path running on : $pathUrl");
    return ApiClient()
        .post(pathUrl: pathUrl, requestBody: requestBody, token: '');
  }
  Future<dynamic> getProduct() async {
    String pathUrl = FakeStoreUrl.fakestorepath.productslist;
    debugPrint("path running on : $pathUrl");
    return ApiClient()
        .get(pathUrl: pathUrl, token: '');
  }
  Future<dynamic> getProductCategory() async {
    String pathUrl = FakeStoreUrl.fakestorepath.productscategory;
    debugPrint("path running on : $pathUrl");
    return ApiClient()
        .get(pathUrl: pathUrl, token: '');
  }
  Future<dynamic> getProductCart(String uid) async {
    String pathUrl = FakeStoreUrl.fakestorepath.productcart+uid;
    debugPrint("path running on : $pathUrl");
    return ApiClient()
        .get(pathUrl: pathUrl, token: '');
  }
}