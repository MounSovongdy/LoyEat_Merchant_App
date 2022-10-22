import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_detail_screen.dart';

import '../../constants/constants.dart';
import '../../utility/text_style.dart';
import '../../utility/widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: getOrder(context),
    );
  }

  Widget getOrder(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, index) => AppWidget.order(
        context: context,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderDetailScreen(),
          ),
        ),
      ),
    );
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
