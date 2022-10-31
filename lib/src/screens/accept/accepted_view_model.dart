import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loy_eat_merchant_app/src/constants/cache_helper.dart';
import '../../../models/remote_data.dart';

class AcceptedViewModel extends GetxController {

  final orderCollection = FirebaseFirestore.instance.collection('orders');
  final orderDetailCollection = FirebaseFirestore.instance.collection('orders_detail');

  final _orderData = RemoteData<bool>(status: RemoteDataStatus.processing, data: null).obs;
  RemoteData<bool> get orderData => _orderData.value;

  final cacheHelper = CacheHelper();

  var selectedIndex = 0.obs;

  var orderId = [];
  var orderDate = [];
  var orderTime = [];
  var orderItems = [];
  var orderAmount = [];

  var subAmount = '0.00'.obs;
  var merchantId = ''.obs;
  var currentDate = '';

  var tempOrderAmount = '';
  var tempOrder = [];

  @override
  void onInit() {
    super.onInit();
    getCurrentDate();
    readMerchantId();
  }

  void getCurrentDate() {
    var now = DateTime.now();
    var format = DateFormat('dd-MMM-yy');

    currentDate = format.format(now);
  }

  void readMerchantId() async {
    merchantId.value = '';
    merchantId.value = await cacheHelper.readCache();
    debugPrint('merchantId.value order = ${merchantId.value}');
    getNewOrder();
  }

  void getNewOrder() {
    final order = orderCollection.where('merchant_id', isEqualTo: merchantId.value).where('date', isEqualTo: currentDate).where('status', isEqualTo: 'Accepted').snapshots();
    order.listen((result) async {

      _orderData.value = RemoteData<bool>(status: RemoteDataStatus.processing, data: null);

      clearList();

      if (result.docs.isNotEmpty) {

        for (int i = 0; i < result.docs.length; i++) {
          var tempOrderID = result.docs[i]['order_id'];
          var tempOrderDate = result.docs[i]['date'];
          var tempOrderTime = result.docs[i]['time'];

          final orderDetail = orderDetailCollection.where('order_id', isEqualTo: tempOrderID).snapshots();
          orderDetail.listen((e) {
            if (e.docs.isNotEmpty) {
              for (var data in e.docs) {
                tempOrderAmount = data.data()['sub_amount'];
                tempOrder = data.data()['items'];

                orderId.add(tempOrderID);
                orderDate.add(tempOrderDate);
                orderTime.add(tempOrderTime);
                orderAmount.add(tempOrderAmount);
                orderItems.add(tempOrder);
              }

              if (i + 1 == result.docs.length) {
                debugPrint('order = $orderId');
                debugPrint('date = $orderDate');
                debugPrint('time = $orderTime');
                debugPrint('items = $orderItems');
                debugPrint('amount = $orderAmount');

                _orderData.value = RemoteData<bool>(status: RemoteDataStatus.success, data: true);
              }
            }
          });
        }
      }
      else {
        clearList();
        _orderData.value = RemoteData<bool>(status: RemoteDataStatus.none, data: null);
      }
    });
  }

  void clearList() {
    subAmount.value = '0.00';
    orderId.clear();
    orderDate.clear();
    orderTime.clear();
    orderAmount.clear();
    orderItems.clear();

    tempOrderAmount = '';
    tempOrder.clear();
  }
}