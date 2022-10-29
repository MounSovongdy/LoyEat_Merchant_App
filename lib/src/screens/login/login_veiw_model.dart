import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginVeiwModel extends GetxController{
  var otpPassword  = false.obs;

  final phoneNumber = TextEditingController();
    final formKey = GlobalKey<FormState>();


  void butonClick (){
    otpPassword.value = true;
  }
}