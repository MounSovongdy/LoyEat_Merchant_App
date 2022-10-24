import 'package:flutter/material.dart';
import 'package:loy_eat_merchant_app/src/constants/constants.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';
import 'package:loy_eat_merchant_app/src/utility/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
        children: [
          const SizedBox(
            height: defaultPaddin,
          ),
          getStats(context),
          const SizedBox(
            height: defaultPaddin,
          ),
          getNewOrder(context),
        ],
      ),
    );
  }

  Column getStats(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stats',
          style: AppTextStyle.headline1,
        ),
        const SizedBox(
          height: defaultPaddin,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppWidget.card2(context, 'Total Order', 123),
            AppWidget.card2(context, 'Total Product', 20),
          ],
        ),
        const SizedBox(
          height: defaultPaddin,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppWidget.card2(context, 'Total Sale', 1234),
            AppWidget.card2(context, 'Total Customer', 20),
          ],
        ),
      ],
    );
  }

  Column getNewOrder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Order',
          style: AppTextStyle.headline1,
        ),
        const SizedBox(
          height: defaultPaddin,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppWidget.card1(
              context: context,
              title: 'Pending',
              icon: Icons.schedule,
              amount: 2,
              backgroundColor: Colors.yellow.shade600,
            ),
            AppWidget.card1(
              context: context,
              title: 'Accepted',
              icon: Icons.done,
              amount: 2,
              backgroundColor: Colors.blue.shade600,
            ),
          ],
        ),
        const SizedBox(
          height: defaultPaddin,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppWidget.card1(
              context: context,
              title: 'Successful',
              icon: Icons.check_circle_outline,
              amount: 2,
              backgroundColor: Colors.green.shade600,
            ),
            AppWidget.card1(
              context: context,
              title: 'Rejected',
              icon: Icons.cancel_outlined,
              amount: 4,
              backgroundColor: Colors.red.shade600,
            ),
          ],
        ),
      ],
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryGrayColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.toggle_off,
            size: 32,
            color: blackColor,
          ),
          Spacer(),
          Icon(
            Icons.notifications,
            color: blackColor,
          ),
        ],
      ),
    );
  }
}
