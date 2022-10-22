import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/utility/button.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';
import 'package:loy_eat_merchant_app/src/utility/widget.dart';

import '../../constants/constants.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
      itemBuilder: (BuildContext context, index) => AppWidget.product(context),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Menu',
            style: AppTextStyle.headline1.copyWith(color: whiteColor),
          ),
          const Spacer(),
          AppButton.button2('Add New', onTap: () {}, leftIcon: Icons.add)
        ],
      ),
    );
  }
}
