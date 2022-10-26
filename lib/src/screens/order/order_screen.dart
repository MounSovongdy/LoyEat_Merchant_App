import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_detail_screen.dart';

import '../../../models/remote_data.dart';
import '../../constants/constants.dart';
import '../../utility/text_style.dart';
import '../../utility/widget.dart';
import 'order_view_model.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final orderViewModel = Get.put(OrderViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: getOrder(context),
    );
  }

  Widget getOrder(BuildContext context) {
    return Obx(() {
      final status = orderViewModel.orderData.status;
      if (status == RemoteDataStatus.processing) {
        return AppWidget.noOrderData;
      } else if (status == RemoteDataStatus.error) {
        return AppWidget.error;
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
            itemCount: orderViewModel.orderId.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) => AppWidget.order(
              context: context,
              onTap: () {
                orderViewModel.selectedIndex.value = index;

                debugPrint('tapped: ${orderViewModel.orderItems[orderViewModel.selectedIndex.value][0]['product_name']}');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(),
                  ),
                );
              },
              orderId: orderViewModel.orderId[index],
              orderDate: orderViewModel.orderDate[index],
              orderTime: orderViewModel.orderTime[index],
              productName: orderViewModel.orderItems[index][0]['product_name'].toString(),
              qty: orderViewModel.orderItems[index][0]['qty'].toString(),
              amount: orderViewModel.orderAmount[index],
            ),
          ),
        );
      }
    });
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Order',
        style: AppTextStyle.headline1.copyWith(color: whiteColor),
      ),
    );
  }
}