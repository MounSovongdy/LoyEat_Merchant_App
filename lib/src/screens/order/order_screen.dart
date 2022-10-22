import 'package:flutter/material.dart';

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
      body: getProduct(context),
    );
  }

  Widget getProduct(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, index) => AppWidget.order(context),
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
