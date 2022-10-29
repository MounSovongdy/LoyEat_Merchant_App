import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/constants/constants.dart';
import 'package:loy_eat_merchant_app/src/screens/startup/start_up_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var app = GetMaterialApp(
      home: getHome,
      debugShowCheckedModeBanner: false,
  );
  runApp(app);
}

Widget get getHome {
  Timer(
    const Duration(seconds: 3),
        () => Navigator.of(Get.context!).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const StartUpScreen(),
      ),
    ),
  );
  return const Scaffold(
    backgroundColor: primaryColor,
    body: Center(
      child: Image(image: AssetImage('assets/image/logo_merchant.png')),
    ),
  );
}