import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppForm {
  static Widget input({
    required String hintText,
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
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
