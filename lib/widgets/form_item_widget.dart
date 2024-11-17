import 'package:flutter/material.dart';

class FormItemWidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
  IconData icon;
  int maxLines;
  FormItemWidget({
    required this.controller,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        maxLines: maxLines,
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hint,
          filled: true,
          fillColor: Colors.black.withOpacity(0.35),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
