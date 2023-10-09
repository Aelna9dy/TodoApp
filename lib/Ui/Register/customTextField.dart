import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  String hint;
  bool isPassword;
  TextInputType keyboardType;
  MyValidator validator;
  TextEditingController controller;

  CustomTextFormField({
    super.key,
    required this.validator,
    required this.controller,
    required this.hint,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(hintText: hint, border: OutlineInputBorder()),
    );
  }
}
