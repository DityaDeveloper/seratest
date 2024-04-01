// ignore_for_file: avoid_print, null_argument_to_non_null_type

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seratest/app/routes/route_name.dart';
import 'package:seratest/domain/repositories/remote/user/user_repo.dart';

import '../../../data/model/user/user_model.dart';

class LoginController extends GetxController with StateMixin<UserModel> {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userRepository = UserRepository();
  final boxStorage = GetStorage();

  @override
  void onInit() {
    emailController.text = 'ditya@sera.com';
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void login() {
    FocusManager.instance.primaryFocus?.unfocus();
    // String user = 'donero';
    // String password = "ewedon";
    String  user = emailController.text;
    String password =  passwordController.text;
    if (loginFormKey.currentState!.validate()) {
      change(null, status: RxStatus.success());
      checkUser(user, password).then((auth) async {
        if (auth != '') {
          await getuser(user).then((value) {
            debugPrint('is token : $auth');
            change(null, status: RxStatus.loading());
            Get.toNamed(RoutesName.home);
            boxStorage.write('uid', value.id.toString());
            Get.snackbar('Login successfully', value.email);
          });
        } else {
          change(null, status: RxStatus.empty());
          Get.snackbar('Login', 'Invalid email or password');
        }
      });
    }
  }

  Future<String> checkUser(String user, String password) async {
    final response =
        await userRepository.loginUser(email: user, password: password);
    if (response != null) {
      return Future.value(response['metadata']['token']);
    }
    return Future.value('');
  }

  Future<UserModel> getuser(String username) async {
    final response = await userRepository.getUserlist();
    if (response.isNotEmpty) {
      var data = response
          .where((item) => item.username.toString() == username.toLowerCase())
          .toList();
      return data[0];
    }
    return Future.value();
  }
}
