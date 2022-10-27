import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_view_model.dart';

class AccountViewModel extends GetxController {
  final orderViewModel = Get.put(OrderViewModel());

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
        .where('merchant_id', isEqualTo: orderViewModel.merchantId.value)
        .snapshots();
    merchant.listen((result) {
      for (var data in result.docs) {
        merchantName = data.data()['merchant_name'];
        merchantImage = data.data()['image'];
      }
    });
  }
}