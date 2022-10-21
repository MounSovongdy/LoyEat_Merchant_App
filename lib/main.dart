import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/widget/bottom_nav_bar_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
  );
   const app = GetMaterialApp(
    home: BottomNavigationBarExample(),
    debugShowCheckedModeBanner: false,
  );
  runApp(app);
}

