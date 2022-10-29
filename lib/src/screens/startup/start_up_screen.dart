import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/screens/login/login_srceen.dart';
import 'package:loy_eat_merchant_app/src/utility/bottom_nav_bar_widget.dart';
import '../../constants/constants.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Image(image: AssetImage('assets/image/logo_merchant.png')),
            );
          }
          else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong...'));
          }
          else if (snapshot.hasData) {
            return BottomNavigationBarExample(index: 0);
          }
          else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}