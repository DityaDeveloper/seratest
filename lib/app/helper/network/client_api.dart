
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/app_environment.dart';
import '../../utils/constant/txtnotif/snackbar_text.dart';

part '_payload_data.dart';

class ApiClient {
  final PayloadData payloadData = PayloadData();
  String envBaseurl = AppEnvironment.instance.baseUrl;

  Future post(
      {required pathUrl,
      required Map requestBody,
      required String token}) async {
    final fullUrl = envBaseurl + pathUrl;
    Map<String, String> headers = {};
    if (token == '') {
      headers = {
        "Content-Type": "application/json"
        //"X-CSRF-Token": "",
      };
    } else {
      headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
        //"X-CSRF-Token": "",
      };
    }

    try {
      final response = await http.Client()
          .post(
        Uri.parse(fullUrl),
        headers: headers,
        body: jsonEncode(requestBody),
      ).timeout(const Duration(seconds: 30), onTimeout: () {
        debugPrint('Request Timeout');
        return http.Response('Request Timeout', 408);
      }).onError((error, stackTrace) {
        debugPrint('invalid connection');
        return http.Response('Internal Server Error', 500);
      });
      return payloadData.catchPayloadData(response);
    } finally {
      http.Client().close();
    }
  }

  Future get({required pathUrl, required String token}) async {
    final fullUrl = envBaseurl + pathUrl;
    Map<String, String> headers = {};
    if (token == '') {
      headers = {
        "Content-Type": "application/json"
        //"X-CSRF-Token": "",
      };
    } else {
      headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
        //"X-CSRF-Token": "",
      };
    }

    try {
      final response = await http.Client()
          .get(Uri.parse(fullUrl), headers: headers)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        debugPrint('Request Timeout');
        return http.Response('Request Timeout', 408);
      }).onError((error, stackTrace) {
        debugPrint('invalid connection');
        return http.Response('Internal Server Error', 500);
      });
      return payloadData.catchPayloadData(response);
    } finally {
      http.Client().close();
    }
  }

}
