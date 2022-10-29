import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_view_model.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';
import '../../constants/constants.dart';

class OrderAcceptedDetailScreen extends StatelessWidget {
  OrderAcceptedDetailScreen({Key? key}) : super(key: key);

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
                    '#291022001',
                    style: AppTextStyle.title2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Date: 29-Oct-22',
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
              //getItemOrder,
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
                        '\$ 80.00',
                        style: AppTextStyle.headline2,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}