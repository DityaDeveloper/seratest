// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:seratest/data/model/product/product_model.dart';
import 'package:seratest/presentation/features/home/home_controller.dart';
import 'package:seratest/presentation/features/home_product/home_product_view.dart';
import 'package:seratest/presentation/features/login/login_controller.dart';

import '../home_product_filter/home_product_filter_view.dart';
part '_home_user_greeting.dart';
part '_home_product_detail.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final LoginController loginCtrl = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "shop IT",
          textAlign: TextAlign.center,
        ),
        leading: const Icon(Icons.usb_rounded),
        actions:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()=> controller.gotoSearch(),
              child: const Icon(Icons.search)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              //onTap: ()=> controller.gotoCart(),
              child: const Icon(Icons.card_giftcard)),
          ),
         
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          HomeUserGreeting(
            username: loginCtrl.emailController.text,
          ),
          HomeProductFilterView(),
          HomeProductView()
        ],
      ),
    );
  }
}
