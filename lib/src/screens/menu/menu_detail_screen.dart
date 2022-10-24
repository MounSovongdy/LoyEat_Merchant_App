import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_detail_view_model.dart';
import '../../constants/constants.dart';
import '../../utility/text_style.dart';

class MenuDetailScreen extends StatelessWidget {
  MenuDetailScreen({Key? key}) : super(key: key);

  final menuDetailViewModel = Get.put(MenuDetailViewModel());

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

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
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(defaultPaddin),
        padding: const EdgeInsets.all(defaultPaddin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultPaddin),
          color: whiteColor,
        ),
        child: Form(
          key: menuDetailViewModel.formKey,
          child: Column(
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
                      Text('221022001', style: AppTextStyle.headline2),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPaddin/2,
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
                      const Text('Creat Date'),
                      const Spacer(),
                      Text('24-Oct-22', style: AppTextStyle.headline2),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPaddin/2,
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
                      Text('Green Tea Latte', style: AppTextStyle.headline2),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPaddin/2,
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
                      Text('Milk Tea', style: AppTextStyle.headline2),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPaddin/2,
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
                      Text('\$2.50', style: AppTextStyle.headline2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
