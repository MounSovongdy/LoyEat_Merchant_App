import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDetailViewModel extends GetxController {

  final formKey = GlobalKey<FormState>();

  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  final salePrice = TextEditingController();
}
