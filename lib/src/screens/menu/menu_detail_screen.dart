import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_view_model.dart';
import '../../../models/remote_data.dart';
import '../../constants/constants.dart';
import '../../utility/button.dart';
import '../../utility/text_style.dart';
import '../../utility/widget.dart';

class MenuDetailScreen extends StatelessWidget {
  MenuDetailScreen({Key? key}) : super(key: key);

  final menuViewModel = Get.put(MenuViewModel());
  final products = FirebaseFirestore.instance.collection('products');

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
        'Menu Detail',
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
    return Obx(() {
      final status = menuViewModel.productData.status;
      if (status == RemoteDataStatus.processing) {
        return AppWidget.loading;
      } else if (status == RemoteDataStatus.error) {
        return AppWidget.error;
      } else {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(defaultPaddin),
              padding: const EdgeInsets.all(defaultPaddin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPaddin),
                color: whiteColor,
              ),
              child: Form(
                key: menuViewModel.formKey,
                child: columnForm(
                  id: menuViewModel
                      .arrayProductId[menuViewModel.selectedIndex.value],
                  date: menuViewModel
                      .arrayProductDateOrder[menuViewModel.selectedIndex.value],
                  title: menuViewModel
                      .arrayProductTitle[menuViewModel.selectedIndex.value],
                  subTitle: menuViewModel
                      .arrayProductSubTitle[menuViewModel.selectedIndex.value],
                  price: menuViewModel
                      .arrayProductPrice[menuViewModel.selectedIndex.value],
                ),
              ),
            ),
            buttonEnable(context: context),
          ],
        );
      }
    });
  }

  Widget columnForm({
    required String id,
    required String date,
    required String title,
    required String subTitle,
    required String price,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPaddin),
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddin, vertical: defaultPaddin),
            child: Row(
              children: [
                const Text('Product ID'),
                const Spacer(),
                Text(id, style: AppTextStyle.headline2),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPaddin / 2,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPaddin),
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddin, vertical: defaultPaddin),
            child: Row(
              children: [
                const Text('Create Date'),
                const Spacer(),
                Text(date, style: AppTextStyle.headline2),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPaddin / 2,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPaddin),
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddin, vertical: defaultPaddin),
            child: Row(
              children: [
                const Text('Title'),
                const Spacer(),
                Text(title, style: AppTextStyle.headline2),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPaddin / 2,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPaddin),
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddin, vertical: defaultPaddin),
            child: Row(
              children: [
                const Text('Category'),
                const Spacer(),
                Text(subTitle, style: AppTextStyle.headline2),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPaddin / 2,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPaddin),
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddin, vertical: defaultPaddin),
            child: Row(
              children: [
                const Text('Price'),
                const Spacer(),
                Text('\$ $price', style: AppTextStyle.headline2),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonEnable({
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: AppButton.button1(
              'Disable',
              backgroundColor: secondGrayColor,
              leftIcon: Icons.close,
              onTap: () {
                menuViewModel.updateStatusProduct(false, menuViewModel.arrayProductId[menuViewModel.selectedIndex.value]);
                Get.back();
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: AppButton.button1(
              'Enable',
              leftIcon: Icons.done,
              onTap: () {
                menuViewModel.updateStatusProduct(true, menuViewModel.arrayProductId[menuViewModel.selectedIndex.value]);
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
