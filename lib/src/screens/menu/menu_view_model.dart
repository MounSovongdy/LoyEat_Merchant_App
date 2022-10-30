import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loy_eat_merchant_app/src/constants/cache_helper.dart';
import 'package:loy_eat_merchant_app/src/screens/message/message_screen.dart';
import '../../../models/remote_data.dart';

class MenuViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();

  final productCollection = FirebaseFirestore.instance.collection('products');

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
  var arrayProductStatus = [];

  @override
  void onInit() {
    super.onInit();
    readMerchantId();
  }

  void readMerchantId() async {
    merchantId.value = '';
    final cacheHelper = CacheHelper();
    merchantId.value = await cacheHelper.readCache();
    debugPrint('merchantId.value menu = ${merchantId.value}');
    getCurrentDate();
    getMerchantProduct();
    getLastProId();
  }

  void getCurrentDate() {
    var now = DateTime.now();
    var format = DateFormat('dd-MMM-yy');

    currentDate.value = format.format(now);
  }

  void getMerchantProduct() {
    final product = productCollection.where('merchant_id', isEqualTo: merchantId.value).snapshots();
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
          var status = data.data()['status'];

          arrayProductId.add(id);
          arrayProductImage.add(image);
          arrayProductTitle.add(title);
          arrayProductDateOrder.add(date);
          arrayProductSubTitle.add(subTitle);
          arrayProductPrice.add(price);
          arrayProductStatus.add(status);

          _productData.value =
              RemoteData<bool>(status: RemoteDataStatus.success, data: true);
        }
      }
    });
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

  void updateStatusProduct(bool status, String id) {
    if (status == true) {
      productCollection.where('product_id', isEqualTo: id).get().then((value) {
        for (var data in value.docs) {
          var docId = data.id;

          productCollection.doc(docId).update({'status': true});
        }
      });
    }
    if (status == false) {
      productCollection.where('product_id', isEqualTo: id).get().then((value) {
        for (var data in value.docs) {
          var docId = data.id;

          productCollection.doc(docId).update({'status': false});
        }
      });
    }
  }

  void clearProductList() {
    arrayProductId.clear();
    arrayProductImage.clear();
    arrayProductTitle.clear();
    arrayProductDateOrder.clear();
    arrayProductSubTitle.clear();
    arrayProductPrice.clear();
    arrayProductStatus.clear();
  }

  void clearTextField() {
    title.clear();
    category.clear();
    salePrice.clear();
    image.clear();
  }
}
