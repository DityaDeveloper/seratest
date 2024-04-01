import 'package:flutter/foundation.dart';

import '../../../app/helper/network/client_api.dart';
import '../../../app/utils/constant/uri/fakestore/fakestore_url.dart';

class UserDatasource {

  Future<dynamic> createUser(Map requestBody) async {
    String pathUrl = FakeStoreUrl.fakestorepath.users;
    debugPrint("path running on : $pathUrl");
    return ApiClient()
        .post(pathUrl: pathUrl, requestBody: requestBody, token: '');
  }
  Future<dynamic> getUser() async {
    String pathUrl = FakeStoreUrl.fakestorepath.users;
    debugPrint("path running on : $pathUrl");
    return ApiClient()
        .get(pathUrl: pathUrl, token: '');
  }

  Future<dynamic> loginUser({required Map body}) async {
    String pathUrl = FakeStoreUrl.fakestorepath.authlogin;
    debugPrint("path running on : $pathUrl");
    return ApiClient()
        .post(pathUrl: pathUrl, requestBody: body,  token: '');
  }
}