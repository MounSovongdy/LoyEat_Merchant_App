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

  var currentDate = ''.obs;
  var subAmount = '0.00'.obs;
  var orderId = [];
  var orderDate = [];
  var orderTime = [];
  var orderAmount = [];
  var orderItems = [];

  @override
  void onInit() {
    super.onInit();
    getCurrentDate();
    getNewOrder();
  }

  void getCurrentDate() {
    var now = DateTime.now();
    var format = DateFormat('dd-MMM-yy');

    currentDate.value = format.format(now);
  }

  void getNewOrder() {
    final order = orderCollection.where('driver_id', isEqualTo: '').where('date', isEqualTo: '20-Oct-22').where('is_new', isEqualTo: true).snapshots();
    order.listen((result) {
      clearList();

      if (result.docs.isNotEmpty) {
        for (var data in result.docs) {
          final id = data.data()['order_id'];
          final date = data.data()['date'];
          final time = data.data()['time'];
          orderId.add(id);
          orderDate.add(date);
          orderTime.add(time);

          final orderDetail = orderDetailCollection.where('order_id', isEqualTo: id).snapshots();
          orderDetail.listen((e) {
            if (e.docs.isNotEmpty) {
              for (var data in e.docs) {

                for (int i = 0 ; i < data.data()['items'].length ; i++) {
                  var productId = data.data()['items'][i]['product_id'];
                  var qty = data.data()['items'][i]['qty'];

                  final product = productCollection.where('product_id', isEqualTo: productId).snapshots();
                  product.listen((event) {
                    if (event.docs.isNotEmpty) {
                      var tempOrderItems = [];

                      for (var data in event.docs) {
                        var productName = data.data()['product_name'];
                        var productPrice = data.data()['price'];
                        tempOrderItems.add({'product_id': productId, 'product_name': productName, 'product_price': productPrice, 'qty': qty});
                        subAmount.value = (double.parse(subAmount.value) + double.parse(productPrice)).toStringAsFixed(2);
                      }

                      if (i + 1 == data.data()['items'].length) {
                        orderAmount.add(subAmount.value);
                        orderItems.add(tempOrderItems);
                        debugPrint('orderId: $orderId');
                        debugPrint('dateOrder: $orderDate');
                        debugPrint('timeOrder: $orderTime');
                        debugPrint('itemsOrder: $orderItems');
                        debugPrint('amountOrder: $orderAmount');
                        _orderData.value = RemoteData<bool>(status: RemoteDataStatus.success, data: true);
                      }
                    }
                  });
                }

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
    currentDate.value = '';
    subAmount.value = '0.00';
    orderId.clear();
    orderDate.clear();
    orderTime.clear();
    orderAmount.clear();
    orderItems.clear();
  }
}