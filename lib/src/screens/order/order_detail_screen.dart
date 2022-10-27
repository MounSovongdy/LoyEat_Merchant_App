import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_view_model.dart';
import 'package:loy_eat_merchant_app/src/utility/button.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';

import '../../constants/constants.dart';
import '../../utility/bottom_nav_bar_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  OrderDetailScreen({Key? key}) : super(key: key);

  final orderViewModel = Get.put(OrderViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: getDetail(context),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Order Detail',
        style: AppTextStyle.headline1.copyWith(color: whiteColor),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop(false);
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
    );
  }

  Widget getDetail(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPaddin),
          margin: const EdgeInsets.all(defaultPaddin),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultPaddin),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${orderViewModel.orderId[orderViewModel.selectedIndex.value]}',
                    style: AppTextStyle.title2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Date: ${orderViewModel.orderDate[orderViewModel.selectedIndex.value]}',
                    style: AppTextStyle.title2,
                  ),
                ],
              ),
              Container(
                height: 2,
                color: Colors.black.withOpacity(0.2),
                margin: const EdgeInsets.only(top: 10),
              ),
              const SizedBox(
                height: defaultPaddin / 2,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(flex: 1, child: Text('No', style: TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(flex: 5, child: Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(width: 20),
                  Expanded(flex: 0, child: Text('Qty', style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(width: 20),
                  Text('Total', style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              Container(
                height: 2,
                color: Colors.black.withOpacity(0.2),
                margin: const EdgeInsets.only(top: 10),
              ),
              const SizedBox(
                height: defaultPaddin / 2,
              ),
              getItemOrder,
              Container(
                decoration: BoxDecoration(
                  color: primaryGrayColor,
                  borderRadius: BorderRadius.circular(defaultPaddin),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(defaultPaddin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: AppTextStyle.headline2,
                      ),
                      Text(
                        '\$ ${orderViewModel.orderAmount[orderViewModel.selectedIndex.value]}',
                        style: AppTextStyle.headline2,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: AppButton.button1('Cancel',
                  backgroundColor: secondGrayColor,
                  leftIcon: Icons.close,
                  onTap: () {
                    orderViewModel.buttonRejected();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationBarExample(index: 0),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: AppButton.button1(
                  'Accept',
                  leftIcon: Icons.done,
                  onTap: () {
                    orderViewModel.buttonAccept();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationBarExample(index: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get getItemOrder {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: orderViewModel.orderItems[orderViewModel.selectedIndex.value].length,
        itemBuilder: (context, index) {
          double subAmount = double.parse(orderViewModel.orderItems[orderViewModel.selectedIndex.value][index]['price']) * double.parse(orderViewModel.orderItems[orderViewModel.selectedIndex.value][index]['qty']);
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: Text('${index + 1}. ')),
                Expanded(flex: 5, child: Text(orderViewModel.orderItems[orderViewModel.selectedIndex.value][index]['product_name'])),
                Expanded(flex: 0, child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(orderViewModel.orderItems[orderViewModel.selectedIndex.value][index]['qty']),
                )),
                Text('\$ ${subAmount.toStringAsFixed(2)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}