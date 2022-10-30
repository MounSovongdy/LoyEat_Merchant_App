import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/constants/cache_helper.dart';

import '../../../models/remote_data.dart';

class HomeViewModel extends GetxController {

  var toggleStatus  = false.obs;
  var merchantId = ''.obs;
  var docID = ''.obs;

  final merchantCollection  = FirebaseFirestore.instance.collection('merchants');

  final _toggleData = RemoteData<bool>(status: RemoteDataStatus.processing, data: null).obs;
  RemoteData<bool> get toggleData => _toggleData.value;

  @override
  void onInit() {
    super.onInit();
    readMerchantId();
  }

  void readMerchantId() async {
    merchantId.value = '';
    final cacheHelper = CacheHelper();
    merchantId.value = await cacheHelper.readCache();
    debugPrint('merchantId.value home = ${merchantId.value}');
    getToggleStatus();
  }

  void getToggleStatus() {
    debugPrint('getToggleStatus');
    merchantCollection.where('merchant_id', isEqualTo: merchantId.value).get().then((value) {
       for (var data in value.docs) {
         toggleStatus.value = data.data()['is_available'];
         docID.value = data.id;
       }
     });
  }

  void clickToggle() {
    _toggleData.value = RemoteData<bool>(status: RemoteDataStatus.processing, data: null);

    if (toggleStatus.value == false) {
      merchantCollection.doc(docID.value).update({
        'is_available': true,
      }).then((_) {
        getToggleStatus();
        _toggleData.value = RemoteData<bool>(status: RemoteDataStatus.success, data: true);
      });
    }
    else {
      merchantCollection.doc(docID.value).update({
        'is_available': false,
      }).then((_) {
        getToggleStatus();
        _toggleData.value = RemoteData<bool>(status: RemoteDataStatus.success, data: true);
      });
    }
  }
}