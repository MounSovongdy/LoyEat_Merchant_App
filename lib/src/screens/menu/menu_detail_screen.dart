import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_detail_view_model.dart';
import 'package:loy_eat_merchant_app/src/screens/message/message_screen.dart';
import 'package:loy_eat_merchant_app/src/utility/button.dart';
import 'package:loy_eat_merchant_app/src/utility/form.dart';

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
              AppForm.input(
                hintText: 'Tittle (require)',
                controller: menuDetailViewModel.title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter title';
                  }
                  return null;
                },
              ),
              AppForm.input(
                hintText: 'Category *(require)',
                controller: menuDetailViewModel.category,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter category';
                  }
                  return null;
                },
              ),
              AppForm.input(
                hintText: 'Sale Price *(require)',
                controller: menuDetailViewModel.salePrice,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Sale price';
                  }
                  return null;
                },
              ),
              AppForm.input(
                hintText: 'Image *(require)',
                controller: menuDetailViewModel.image,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please upload image';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: defaultPaddin,
              ),
              AppButton.button1('Save', onTap: () async {
                await products.add({
                  'create_at': '',
                  'detail': menuDetailViewModel.category.text,
                  'image': 'assets/image/${menuDetailViewModel.image.text}',
                  'merchant_id': '',
                  'price': menuDetailViewModel.salePrice.text,
                  'product_id': '',
                  'product_name': menuDetailViewModel.title.text,
                }).then((value) {
                  if (menuDetailViewModel.formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MessageScreen(),
                      ),
                    );
                  }
                });
                menuDetailViewModel.title.clear();
                menuDetailViewModel.category.clear();
                menuDetailViewModel.salePrice.clear();
                menuDetailViewModel.image.clear();
              },
              leftIcon: Icons.save)
            ],
          ),
        ),
      ),
    );
  }
}
