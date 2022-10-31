import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/models/remote_data.dart';
import 'package:loy_eat_merchant_app/src/screens/accept/accepted_detail_screen.dart';
import 'package:loy_eat_merchant_app/src/screens/accept/accepted_view_model.dart';
import '../../constants/constants.dart';
import '../../utility/text_style.dart';
import '../../utility/widget.dart';

class AcceptedScreen extends StatelessWidget {
  AcceptedScreen({Key? key}) : super(key: key);

  final acceptedViewModel = Get.put(AcceptedViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: getOrder(context),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        'Accepted',
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

  Widget getOrder(BuildContext context) {
    return Obx(() {
      final status = acceptedViewModel.orderData.status;
      if (status == RemoteDataStatus.none) {
        return AppWidget.noOrderData;
      } else if (status == RemoteDataStatus.processing) {
        return AppWidget.loading;
      } else if (status == RemoteDataStatus.error) {
        return AppWidget.error;
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
            itemCount: acceptedViewModel.orderId.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) => AppWidget.order(
              context: context,
              onTap: () {
                acceptedViewModel.selectedIndex.value = index;

                debugPrint('tapped: ${acceptedViewModel.orderItems[acceptedViewModel.selectedIndex.value][0]['product_name']}');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcceptedDetailScreen(),
                  ),
                );
              },
              orderId: acceptedViewModel.orderId[index],
              orderDate: acceptedViewModel.orderDate[index],
              orderTime: acceptedViewModel.orderTime[index],
              productName: acceptedViewModel.orderItems[index][0]['product_name'].toString(),
              qty: acceptedViewModel.orderItems[index][0]['qty'].toString(),
              amount: acceptedViewModel.orderAmount[index],
              status: 'Accepted',
            ),
          ),
        );
      }
    });
  }
}
