import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        inputFormatters: inputFormatters,
        validator: validator,
        keyboardType: inputType,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
