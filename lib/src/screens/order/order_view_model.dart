import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../models/remote_data.dart';
import '../menu/menu_view_model.dart';

class OrderViewModel extends GetxController {
  final orderCollection = FirebaseFirestore.instance.collection('orders');
  final orderDetailCollection = FirebaseFirestore.instance.collection('orders_detail');
  final productCollection = FirebaseFirestore.instance.collection('products');
  final merchantCollection  = FirebaseFirestore.instance.collection('merchants');

  final menuViewModel = Get.put(MenuViewModel());

  final _orderData =
      RemoteData<bool>(status: RemoteDataStatus.processing, data: null).obs;
  RemoteData<bool> get orderData => _orderData.value;
  final _pendingData =
      RemoteData<bool>(status: RemoteDataStatus.processing, data: null).obs;
  RemoteData<bool> get pendingData => _pendingData.value;

  var selectedIndex = 0.obs;

  var currentDate = '';
  var subAmount = '0.00'.obs;

  var pendingNumber = 0.obs;
  var acceptedNumber = 0.obs;
  var orderToday = 0.obs;
  var saleToday = 0.0.obs;

  var orderId = [];
  var orderDate = [];
  var orderTime = [];
  var orderItems = [];
  var orderAmount = [];

  var tempOrderAmount = '';
  var tempOrder = [];

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    getCurrentDate();
    getNewOrder();
    getAcceptedNumber();
    getAllOrderToday();
  }

  void getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    final num = user?.phoneNumber.toString();

    final merchant = await merchantCollection.where('tel', isEqualTo: num.toString()).get();
    if (merchant.docs.isNotEmpty) {
      for (var data in merchant.docs) {
        var id = data.data()['merchant_id'];
        menuViewModel.merchantId.value = id.toString();
      }
      getNewOrder();
      getAcceptedNumber();
      getAllOrderToday();
    }
  }

  void getCurrentDate() {
    var now = DateTime.now();
    var format = DateFormat('dd-MMM-yy');

    currentDate = format.format(now);
  }

  void getAcceptedNumber() {
    final order = orderCollection
        .where('merchant_id', isEqualTo: menuViewModel.merchantId.value)
        .where('date', isEqualTo: currentDate)
        .where('status', isEqualTo: 'Accepted')
        .snapshots();
    order.listen((result) {
      _pendingData.value =
          RemoteData<bool>(status: RemoteDataStatus.processing, data: null);
      saleToday.value = 0.00;
      if (result.docs.isNotEmpty) {
        for (var data in result.docs) {
          var id = data.data()['order_id'];

          final orderDetail = orderDetailCollection
              .where('order_id', isEqualTo: id)
              .snapshots();
          orderDetail.listen((event) {
            if (event.docs.isNotEmpty) {
              for (var element in event.docs) {
                var subAmount = element.data()['sub_amount'];
                acceptedNumber.value = result.docs.length;
                saleToday.value = saleToday.value + double.parse(subAmount);
                _pendingData.value = RemoteData<bool>(
                    status: RemoteDataStatus.success, data: true);
              }
            }
          });
        }
      } else {
        acceptedNumber.value = 0;
        saleToday.value = 0.00;
        _pendingData.value = RemoteData<bool>(status: RemoteDataStatus.success, data: true);
      }
    });
  }

  void getAllOrderToday() {
    final order = orderCollection
        .where('merchant_id', isEqualTo: menuViewModel.merchantId.value)
        .where('date', isEqualTo: currentDate)
        .snapshots();
    order.listen((result) {
      _pendingData.value =
          RemoteData<bool>(status: RemoteDataStatus.processing, data: null);

      if (result.docs.isNotEmpty) {
        orderToday.value = result.docs.length;
        _pendingData.value =
            RemoteData<bool>(status: RemoteDataStatus.success, data: true);
      } else {
        orderToday.value = 0;
        _pendingData.value =
            RemoteData<bool>(status: RemoteDataStatus.success, data: true);
      }
    });
  }

  void getNewOrder() {
    final order = orderCollection
        .where('merchant_id', isEqualTo: menuViewModel.merchantId.value)
        .where('driver_id', isEqualTo: '')
        .where('date', isEqualTo: currentDate)
        .where('status', isEqualTo: 'Pending')
        .snapshots();
    order.listen((result) async {
      _orderData.value =
          RemoteData<bool>(status: RemoteDataStatus.processing, data: null);
      _pendingData.value =
          RemoteData<bool>(status: RemoteDataStatus.processing, data: null);

      clearList();

      if (result.docs.isNotEmpty) {
        pendingNumber.value = result.docs.length;

        for (int i = 0; i < result.docs.length; i++) {
          var tempOrderID = result.docs[i]['order_id'];
          var tempOrderDate = result.docs[i]['date'];
          var tempOrderTime = result.docs[i]['time'];

          final orderDetail = orderDetailCollection
              .where('order_id', isEqualTo: tempOrderID)
              .snapshots();
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

                _orderData.value = RemoteData<bool>(
                    status: RemoteDataStatus.success, data: true);
                _pendingData.value = RemoteData<bool>(
                    status: RemoteDataStatus.success, data: true);
              }
            }
          });
        }
      } else {
        clearList();
        pendingNumber.value = 0;
        _pendingData.value =
            RemoteData<bool>(status: RemoteDataStatus.success, data: true);
        _orderData.value =
            RemoteData<bool>(status: RemoteDataStatus.none, data: null);
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

  void buttonAccept() {
    final order = orderCollection
        .where('order_id', isEqualTo: orderId[selectedIndex.value])
        .snapshots();
    order.listen((result) {
      if (result.docs.isNotEmpty) {
        debugPrint('order id = ${orderId[selectedIndex.value]}');
        for (var element in result.docs) {
          var docId = element.id;

          orderCollection.doc(docId).update({
            'status': 'Accepted',
          });
        }
      }
    });
  }

  void buttonRejected() {
    final order = orderCollection
        .where('order_id', isEqualTo: orderId[selectedIndex.value])
        .snapshots();
    order.listen((result) {
      if (result.docs.isNotEmpty) {
        debugPrint('order id = ${orderId[selectedIndex.value]}');
        for (var element in result.docs) {
          var docId = element.id;

          orderCollection.doc(docId).update({
            'status': 'Rejected',
          });
        }
      }
    });
  }
}
