import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/constants/cache_helper.dart';

import '../../utility/bottom_nav_bar_widget.dart';

class LoginViewModel extends GetxController {
  var showOtpText = false.obs;
  var phoneCorrect = true.obs;
  var otpCorrect = true.obs;

  final phoneNumber = TextEditingController();
  final otpCode = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  var merchantNumber = ''.obs;
  var verificationIDReceived = '';

  final cacheHelper = CacheHelper();
  final merchantCollection = FirebaseFirestore.instance.collection('merchants');

  void buttonNextClick() {
    getMerchantPhoneNumber();
  }

  void buttonSubmitClick() {
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
      verificationCompleted: (PhoneAuthCredential credential) {
        auth.signInWithCredential(credential).then((value) => debugPrint('You are logged in successfully'));
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          debugPrint('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationIDReceived = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    try {
      otpCorrect.value = true;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIDReceived, smsCode: otpCode.text);
      await auth.signInWithCredential(credential).then((value) {
        Future.delayed(const Duration(seconds: 3), () => getCurrentUser());
        Navigator.pushAndRemoveUntil(
          Get.context!,
          MaterialPageRoute<void>(builder: (BuildContext context) => BottomNavigationBarExample(index: 0)), (route) => false,
        );
      });

    } catch (e) {
      debugPrint('your otp number not correctly.');
      otpCorrect.value = false;
    }
  }

  void getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    final num = user?.phoneNumber.toString();

    final merchant = await merchantCollection.where('tel', isEqualTo: num.toString()).get();
    if (merchant.docs.isNotEmpty) {
      for (var data in merchant.docs) {
        String id = data.data()['merchant_id'];
        cacheHelper.writeCache(id);
      }
    }
  }
}