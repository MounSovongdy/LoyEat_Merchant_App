import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/bottom_nav_bar_widget.dart';

class LoginViewModel extends GetxController{
  var otpPassword  = false.obs;

  final phoneNumber = TextEditingController();
  final otpCode = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  var verificationIDReceived = '';

  void buttonNextClick () {
    otpPassword.value = true;
    checkList();
    verifyPhoneNumber();
  }
  void buttonSubmitClick () {
    verifyOTP();
  }

  void checkList() {
    int num = int.parse(phoneNumber.text);
    phoneNumber.text = num.toString();
  }
  void verifyPhoneNumber() async {
    checkList();
    debugPrint('+855${phoneNumber.text}');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+855${phoneNumber.text}',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        Navigator.push(
          Get.context!,
          MaterialPageRoute(builder: (context) => BottomNavigationBarExample(index: 0)),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          debugPrint('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = otpCode.text;
        verificationIDReceived = verificationId;
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  void verifyOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIDReceived, smsCode: otpCode.text);
      await auth.signInWithCredential(credential);
      Navigator.push(
        Get.context!,
        MaterialPageRoute(builder: (context) => BottomNavigationBarExample(index: 0)),
      );
    } catch (e) {
      debugPrint('your otp number not correctly.');
    }
  }
}