import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/menu/menu_view_model.dart';

import '../../../models/remote_data.dart';

class HomeViewModel extends GetxController {

  var toggleStatus  = false.obs;
  var docID = ''.obs;

  final merchantCollection  = FirebaseFirestore.instance.collection('merchants');
  final menuViewModel = Get.put(MenuViewModel());

  final _toggleData = RemoteData<bool>(status: RemoteDataStatus.processing, data: null).obs;
  RemoteData<bool> get toggleData => _toggleData.value;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getToggleStatus() {
     merchantCollection.where('merchant_id', isEqualTo: menuViewModel.merchantId.value).get().then((value) {
       for (var data in value.docs) {
         toggleStatus.value = data.data()['is_available'];
         docID.value = data.id;
       }
     });
  }

  void clickToggle() {
    _toggleData.value = RemoteData<bool>(status: RemoteDataStatus.processing, data: null);

    if (toggleStatus.value == false) {
      merchantCollection.doc(docID.value).update({
        'is_available': true,
      }).then((_) {
        getToggleStatus();
        _toggleData.value = RemoteData<bool>(status: RemoteDataStatus.success, data: true);
      });
    }
    else {
      merchantCollection.doc(docID.value).update({
        'is_available': false,
      }).then((_) {
        getToggleStatus();
        _toggleData.value = RemoteData<bool>(status: RemoteDataStatus.success, data: true);
      });
    }
  }

  void getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    final num = user?.phoneNumber.toString();

    final merchant = await merchantCollection.where('tel', isEqualTo: num.toString()).get();
    if (merchant.docs.isNotEmpty) {
      for (var data in merchant.docs) {
        var id = data.data()['merchant_id'];
        menuViewModel.merchantId.value = id.toString();
      }
      getToggleStatus();
    }
  }
}