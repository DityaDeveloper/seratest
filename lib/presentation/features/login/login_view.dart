// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Shop IT", style: TextStyle(color: Colors.green, fontSize: 40, fontWeight: FontWeight.bold),),
                  Text("Shop from our stores with ease"),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          labelText: 'email',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.greenAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.greenAccent),
                          ),
                        ),
                        validator: controller.validator,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          labelText: 'password',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.greenAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.greenAccent),
                          ),
                        ),
                        validator: controller.validator,
                        obscureText: false,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox.shrink(),
                          Text('Forgot Password ?'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: Get.width,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: controller.login,
                          child: controller.obx(
                            (state) => const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(color: Colors.white,)),
                            ),
                             onEmpty: const Text(
                              "Sign in",
                              style: TextStyle(color: Colors.white),
                            ),
                            onLoading: const Text(
                              "Sign in",
                              style: TextStyle(color: Colors.white),
                            ),
                           
                          ),
                        ),
                      ),
                    ),
                    const Text("Didn't account ? Sign up here"),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
