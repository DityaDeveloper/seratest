import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/routes/route_page.dart';

class SeraApp extends StatefulWidget {
  const SeraApp({super.key});

  @override
  State<SeraApp> createState() => _SeraAppState();
}

class _SeraAppState extends State<SeraApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesPage.init,
      getPages: RoutesPage.routes,
    );
  }
}
