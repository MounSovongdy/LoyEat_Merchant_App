import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/screens/login/login_srceen.dart';
import '../../constants/constants.dart';

class Startupscreen extends StatelessWidget {
  const Startupscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: getProduct(context),
    );
  }

  Widget getProduct(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        ),
      ),
    );
    return const Center(
      child: Image(image: AssetImage('assets/image/logo_merchant.png')),
    );
  }
}
