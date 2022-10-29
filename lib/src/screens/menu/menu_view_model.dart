import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loy_eat_merchant_app/src/screens/message/message_screen.dart';
import '../../../models/remote_data.dart';

class MenuViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();
  final productCollection = FirebaseFirestore.instance.collection('products');
  final merchantCollection = FirebaseFirestore.instance.collection('merchants');

  final _productData = RemoteData<bool>(status: RemoteDataStatus.processing, data: null).obs;
  RemoteData<bool> get productData => _productData.value;

  final title = TextEditingController();
  final category = TextEditingController();
  final salePrice = TextEditingController();
  final image = TextEditingController();

  var selectedIndex = 0.obs;
  var merchantId = ''.obs;
  var currentDate = ''.obs;
  var lastProductId = 0;

  var arrayProductId = [];
  var arrayProductImage = [];
  var arrayProductTitle = [];
  var arrayProductDateOrder = [];
  var arrayProductSubTitle = [];
  var arrayProductPrice = [];

  @override
  void onInit() {
    super.onInit();
    getCurrentDate();
    getCurrentUser();
    getLastProId();
    getMerchantProduct();
  }

  void getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    final num = user?.phoneNumber.toString();
    debugPrint('phoneNumber merchant : $num');

    final merchant = await merchantCollection.where('tel', isEqualTo: num.toString()).get();
    if (merchant.docs.isNotEmpty) {
      for (var data in merchant.docs) {
        var id = data.data()['merchant_id'];
        merchantId.value = id.toString();
      }
      getLastProId();
      getMerchantProduct();
    }
  }

  void getMerchantProduct() {
    debugPrint('merchant_id : ${merchantId.value}');

    final product = productCollection
        .where('merchant_id', isEqualTo: merchantId.value)
        .snapshots();
    product.listen((result) {
      clearProductList();

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

          _productData.value =
              RemoteData<bool>(status: RemoteDataStatus.success, data: true);
        }
      }
    });
  }

  void saveProductToFireBase(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await productCollection.add({
        'create_at': currentDate.toString(),
        'detail': category.text,
        'image': 'assets/image/${image.text}',
        'merchant_id': merchantId.toString(),
        'price': salePrice.text,
        'product_id': lastProductId.toString(),
        'product_name': title.text,
        'status': true,
      }).then((value) {
        clearTextField();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MessageScreen(),
          ),
        );
      });
    }
  }

  void getCurrentDate() {
    var now = DateTime.now();
    var format = DateFormat('dd-MMM-yy');

    currentDate.value = format.format(now);
  }

  void getLastProId() {
    final product = productCollection.snapshots();
    product.listen((data) {
      if (data.docs.isNotEmpty) {
        var tempList = [];
        for (var result in data.docs) {
          int id = int.parse(result.data()['product_id'] ?? '0');
          tempList.add(id);
        }
        lastProductId = tempList.reduce((curr, next) => curr > next ? curr : next) + 1;
        debugPrint('$lastProductId');
      }
    });
  }

  void clearProductList() {
    arrayProductId.clear();
    arrayProductImage.clear();
    arrayProductTitle.clear();
    arrayProductDateOrder.clear();
    arrayProductSubTitle.clear();
    arrayProductPrice.clear();
  }

  void clearTextField() {
    title.clear();
    category.clear();
    salePrice.clear();
    image.clear();
  }
}
