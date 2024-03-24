import 'package:flutter/material.dart';
class FormInputComponent extends StatelessWidget {
  final String hintTex;
  final TextEditingController controller;
  const FormInputComponent({super.key, required this.controller, required this.hintTex});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintTex,
        hintStyle: const TextStyle(
          color: Colors.grey
        )
      ),
    );
  }
}
