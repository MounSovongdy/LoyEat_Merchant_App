import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loy_eat_merchant_app/src/constants/constants.dart';

class AppForm {
  static Widget input({
    required String hintText,
    required TextInputType inputType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    TextEditingController? controller,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        validator: validator,
        keyboardType: inputType,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: primaryColor),
            ),
            hintText: hintText),
      ),
    );
  }
}
