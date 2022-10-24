import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/remote_data.dart';

class MenuViewModel extends GetxController {

  final formKey = GlobalKey<FormState>();
  final products = FirebaseFirestore.instance.collection('products');

  final _productData = RemoteData<bool>(status: RemoteDataStatus.processing, data: null).obs;
  RemoteData<bool> get productData => _productData.value;

  final date = TextEditingController();
  final title = TextEditingController();
  final category = TextEditingController();
  final salePrice = TextEditingController();
  final image = TextEditingController();

  var selectedIndex = 0.obs;
  var merchantId = '6'.obs;

  var arrayProductId = [];
  var arrayProductImage = [];
  var arrayProductTitle = [];
  var arrayProductDateOrder = [];
  var arrayProductSubTitle = [];
  var arrayProductPrice = [];

  @override
  void onInit() {
    super.onInit();
    getMerchantProduct();
  }

  void getMerchantProduct() {
    clearProductList();

    final product = products.where('merchant_id', isEqualTo: merchantId.value).snapshots();
    product.listen((result){
      if (result.docs.isNotEmpty) {
        for (var data in result.docs) {
          var id = data.data()['product_id'];
          var image = data.data()['image'];
          var title = data.data()['product_name'];
          var date = data.data()['create_at'];
          var subTitle = data.data()['detail'];
          var price = data.data()['price'];

          arrayProductId.add(id);
          arrayProductImage.add(image);
          arrayProductTitle.add(title);
          arrayProductDateOrder.add(date);
          arrayProductSubTitle.add(subTitle);
          arrayProductPrice.add(price);

          _productData.value = RemoteData<bool>(status: RemoteDataStatus.success, data: true);
        }
      }
    });
  }

  void clearProductList() {
    arrayProductImage.clear();
    arrayProductTitle.clear();
    arrayProductDateOrder.clear();
    arrayProductSubTitle.clear();
    arrayProductPrice.clear();
  }
}