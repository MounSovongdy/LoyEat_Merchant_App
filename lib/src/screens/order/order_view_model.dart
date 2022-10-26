import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../models/remote_data.dart';

class OrderViewModel extends GetxController {
  final orderCollection = FirebaseFirestore.instance.collection('orders');
  final orderDetailCollection = FirebaseFirestore.instance.collection('orders_detail');
  final productCollection = FirebaseFirestore.instance.collection('products');

  final _orderData = RemoteData<bool>(status: RemoteDataStatus.processing, data: null).obs;
  RemoteData<bool> get orderData => _orderData.value;

  var selectedIndex = 0.obs;

  var currentDate = '';
  var subAmount = '0.00'.obs;

  var orderId = [];
  var orderDate = [];
  var orderTime = [];
  var orderItems = [];
  var orderAmount = [];

  @override
  void onInit() {
    super.onInit();
    getCurrentDate();
    getNewOrder();
  }

  void getCurrentDate() {
    var now = DateTime.now();
    var format = DateFormat('dd-MMM-yy');

    currentDate = format.format(now);
  }

  void getNewOrder() {
    final order = orderCollection.where('driver_id', isEqualTo: '').where('date', isEqualTo: currentDate).where('is_new', isEqualTo: true).snapshots();
    order.listen((result) async {
      clearList();

      if (result.docs.isNotEmpty) {
        _orderData.value = RemoteData<bool>(status: RemoteDataStatus.processing, data: null);

        for (int i = 0 ; i < result.docs.length ; i++) {
          var tempOrderID = result.docs[i]['order_id'];
          var tempOrderDate = result.docs[i]['date'];
          var tempOrderTime = result.docs[i]['time'];
          orderId.add(tempOrderID);
          orderDate.add(tempOrderDate);
          orderTime.add(tempOrderTime);

          final orderDetail = orderDetailCollection.where('order_id', isEqualTo: tempOrderID).snapshots();
          orderDetail.listen((event) {
            if (event.docs.isNotEmpty) {
              for (int i = 0 ; i < event.docs.length ; i++) {
                var tempOrderAmount = event.docs[i]['sub_amount'];
                orderAmount.add(tempOrderAmount);

                var itemsLength = event.docs[i]['items'].length;
                var tempOrder = [];
                for (i = 0 ; i < itemsLength ; i++) {
                  tempOrder.add(event.docs[0]['items'][i]);
                }
                orderItems.add(tempOrder);
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
        _orderData.value = RemoteData<bool>(status: RemoteDataStatus.processing, data: null);
      }
    });
  }

  void clearList() {
    currentDate = '';
    subAmount.value = '0.00';
    orderId.clear();
    orderDate.clear();
    orderTime.clear();
    orderAmount.clear();
    orderItems.clear();
  }
}