import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/bottom_nav_bar_widget.dart';

class LoginViewModel extends GetxController{
  var showOtpText  = false.obs;
  var phoneCorrect = true.obs;
  var otpCorrect = true.obs;

  final phoneNumber = TextEditingController();
  final otpCode = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  var merchantNumber = ''.obs;
  var verificationIDReceived = '';

  final merchantCollection = FirebaseFirestore.instance.collection('merchants');

  void buttonNextClick () {
    getMerchantPhoneNumber();
  }
  void buttonSubmitClick () {
    verifyOTP();
  }

  void checkList() {
    if (phoneNumber.text != '') {
      int num = int.parse(phoneNumber.text);
      phoneNumber.text = num.toString();
      merchantNumber.value = '+855${phoneNumber.text}';
    }
  }
  void getMerchantPhoneNumber() async {
    checkList();
    final merchant = await merchantCollection.where('tel', isEqualTo: merchantNumber.value).get();
    if (merchant.docs.isNotEmpty) {
      showOtpText.value = true;
      phoneCorrect.value = true;
      verifyPhoneNumber();
    } else {
      debugPrint('Phone number is not correctly.');
      showOtpText.value = false;
      phoneCorrect.value = false;
      phoneNumber.text = '';
      merchantNumber.value = '';
    }
  }
  void verifyPhoneNumber() async {
    debugPrint('Phone Number : ${merchantNumber.value}');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+855${phoneNumber.text}',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
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
      otpCorrect.value = true;
      Navigator.push(
        Get.context!,
        MaterialPageRoute(builder: (context) => BottomNavigationBarExample(index: 0)),
      );
    } catch (e) {
      debugPrint('your otp number not correctly.');
      otpCorrect.value = false;
    }
  }

}