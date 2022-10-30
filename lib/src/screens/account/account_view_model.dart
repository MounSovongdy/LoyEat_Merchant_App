import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/constants/cache_helper.dart';
import '../startup/start_up_screen.dart';

class AccountViewModel extends GetxController {

  final merchantCollection = FirebaseFirestore.instance.collection('merchants');

  var merchantId = ''.obs;

  String merchantName = '';
  String merchantImage = '';

  @override
  void onInit() {
    super.onInit();
    readMerchantId();
  }

  void readMerchantId() async {
    merchantId.value = '';
    final cacheHelper = CacheHelper();
    merchantId.value = await cacheHelper.readCache();
    debugPrint('merchantId.value account = ${merchantId.value}');
    getMerchantName();
  }

  void getMerchantName() {
    final merchant = merchantCollection.where('merchant_id', isEqualTo: merchantId.value).snapshots();
    merchant.listen((result) {
      for (var data in result.docs) {
        merchantName = data.data()['merchant_name'];
        merchantImage = data.data()['image'];
      }
    });
  }

  void logout(BuildContext context) {
    signOut();
    Phoenix.rebirth(context);
  }

  Future<StartUpScreen> signOut() async {
    final cacheHelper = CacheHelper();
    cacheHelper.removeCache();
    await FirebaseAuth.instance.signOut();
    return const StartUpScreen();
  }
}