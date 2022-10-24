import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/add_new_menu_screen.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_detail_screen.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_view_model.dart';
import 'package:loy_eat_merchant_app/src/utility/button.dart';
import 'package:loy_eat_merchant_app/src/utility/text_style.dart';
import 'package:loy_eat_merchant_app/src/utility/widget.dart';

import '../../../models/remote_data.dart';
import '../../constants/constants.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);

  final menuDetailViewModel = Get.put(MenuViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      appBar: getAppBar(context),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return Obx(() {
      final status = menuDetailViewModel.productData.status;
      if (status == RemoteDataStatus.processing) {
        return AppWidget.loading;
      } else if (status == RemoteDataStatus.error) {
        return AppWidget.error;
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
            itemCount: menuDetailViewModel.arrayProductTitle.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) => AppWidget.product(
              context: context,
              onTap: () {
                menuDetailViewModel.selectedIndex.value = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuDetailScreen(),
                  ),
                );
              },
              image: menuDetailViewModel.arrayProductImage[index],
              titleText: menuDetailViewModel.arrayProductTitle[index],
              dateOrder: menuDetailViewModel.arrayProductDateOrder[index],
              subTitleText: menuDetailViewModel.arrayProductSubTitle[index],
              price: menuDetailViewModel.arrayProductPrice[index],
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Menu',
            style: AppTextStyle.headline1.copyWith(color: whiteColor),
          ),
          const Spacer(),
          AppButton.button2('Add New', onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewMenuScreen(),
              ),
            );
          }, leftIcon: Icons.add)
        ],
      ),
    );
  }
}
