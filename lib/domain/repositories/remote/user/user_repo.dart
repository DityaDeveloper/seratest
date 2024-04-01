
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:seratest/data/datasource/user/user_datasource.dart';

import '../../../../data/model/user/user_model.dart';

class UserRepository {

   Future<dynamic> loginUser({required String email, required String password})async{
     Map requestbody = {
      'username': email,
      'password': password
     };
     final userdatasource = UserDatasource();
     final response = await userdatasource.loginUser(body: requestbody);
     if (response != null && response['error'] != true) {
      await Future.delayed(const Duration(seconds: 2));
       debugPrint('token : $response');
      return response;
      } else{
        debugPrint('token : $response');
        Get.snackbar('Error', 'Try again');
       return null;
      }
  }

   Future<List<UserModel>> getUserlist()async{
     final userdatasource = UserDatasource();
     final response = await userdatasource.getUser();
     if (response != null) {
      await Future.delayed(const Duration(seconds: 2));
        List<dynamic> parsed =  response['metadata'];
        List<UserModel> userfund =  parsed.map((i) => UserModel.fromJson(i)).toList();
      return userfund;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return [];
      }
  }
} 