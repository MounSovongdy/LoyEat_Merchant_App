import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../menu/menu_view_model.dart';

class AccountViewModel extends GetxController {
  final menuViewModel = Get.put(MenuViewModel());

  final merchantCollection = FirebaseFirestore.instance.collection('merchants');

  String merchantName = '';
  String merchantImage = '';

  @override
  void onInit() {
    super.onInit();
    getMerchantName();
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
}