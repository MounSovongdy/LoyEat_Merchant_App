import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/srceen/home_srceen.dart';
import 'package:loy_eat_merchant_app/src/srceen/login_srceen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

   const app = GetMaterialApp(
    home: HomeSrceen(),
    debugShowCheckedModeBanner: false,
  );
  runApp(app);
}

