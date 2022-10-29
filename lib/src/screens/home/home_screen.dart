import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/constants/constants.dart';
import 'package:loy_eat_merchant_app/src/screens/home/home_view_model.dart';
import 'package:loy_eat_merchant_app/src/screens/order/order_view_model.dart';
import 'package:loy_eat_merchant_app/src/utility/bottom_nav_bar_widget.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';
import 'package:loy_eat_merchant_app/src/utility/widget.dart';
import '../../../models/remote_data.dart';
import '../accept/accepted_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeViewModel = Get.put(HomeViewModel());
  final orderViewModel = Get.put(OrderViewModel());

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

  Widget getStats(BuildContext context) {
    return Obx(() {
      final status = orderViewModel.pendingData.status;
      if (status == RemoteDataStatus.processing) {
        return AppWidget.loading;
      } else if (status == RemoteDataStatus.error) {
        return AppWidget.error;
      } else {
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
                AppWidget.card2(
                    context, 'Order Today', '${orderViewModel.orderToday}'),
                AppWidget.card2(context, 'Sale Today',
                    '\$ ${orderViewModel.saleToday.toStringAsFixed(2)}'),
              ],
            ),
          ],
        );
      }
    });
  }

  Widget getNewOrder(BuildContext context) {
    return Obx(() {
      final status = orderViewModel.pendingData.status;
      if (status == RemoteDataStatus.processing) {
        return AppWidget.loading;
      } else if (status == RemoteDataStatus.error) {
        return AppWidget.error;
      } else {
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BottomNavigationBarExample(index: 2),
                        maintainState: false,
                      ),
                    );
                  },
                  child: AppWidget.card1(
                    context: context,
                    title: 'Pending',
                    icon: Icons.schedule,
                    amount: orderViewModel.pendingNumber.value,
                    backgroundColor: Colors.deepOrange.shade600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AcceptedScreen(),
                        maintainState: false,
                      ),
                    );
                  },
                  child: AppWidget.card1(
                    context: context,
                    title: 'Accepted',
                    icon: Icons.done,
                    amount: orderViewModel.acceptedNumber.value,
                    backgroundColor: Colors.blue.shade600,
                  ),
                ),
              ],
            ),
          ],
        );
      }
    });
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryGrayColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    homeViewModel.clickToggle();
                  },
                  child: Obx(
                    () => Icon(
                      homeViewModel.toggleStatus.value
                          ? Icons.toggle_on
                          : Icons.toggle_off,
                      size: 48,
                      color: blackColor,
                    ),
                  ),
                ),
                const SizedBox(width: defaultPaddin),
                Obx(
                  () => Text(
                    homeViewModel.toggleStatus.value ? 'Online' : 'Offline',
                    style: const TextStyle(color: blackColor),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.notifications,
                size: 32,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
