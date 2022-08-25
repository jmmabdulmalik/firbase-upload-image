import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  String hint;
  IconData icon;
  TextEditingController controler;
  TextFields({
    super.key,
    required this.hint,
    required this.icon,
    required this.controler,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
