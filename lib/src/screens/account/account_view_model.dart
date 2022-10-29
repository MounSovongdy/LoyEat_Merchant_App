import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

import '../menu/menu_view_model.dart';
import '../startup/start_up_screen.dart';

class AccountViewModel extends GetxController {
  final menuViewModel = Get.put(MenuViewModel());

  final merchantCollection = FirebaseFirestore.instance.collection('merchants');

  String merchantName = '';
  String merchantImage = '';

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    final num = user?.phoneNumber.toString();
    debugPrint('phoneNumber merchant : $num');

    final merchant = await merchantCollection.where('tel', isEqualTo: num.toString()).get();
    if (merchant.docs.isNotEmpty) {
      for (var data in merchant.docs) {
        var id = data.data()['merchant_id'];
        menuViewModel.merchantId.value = id.toString();
      }
      getMerchantName();
    }
  }

  void getMerchantName() {
    final merchant = merchantCollection
        .where('merchant_id', isEqualTo: menuViewModel.merchantId.value)
        .snapshots();
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
    await FirebaseAuth.instance.signOut();

    return const StartUpScreen();
  }
}