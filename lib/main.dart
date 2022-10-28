import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/login/login_srceen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
  );

    var app = const GetMaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
  );
  runApp(app);
}