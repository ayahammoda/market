import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Function onclick;
  final String labelText;
  final TextEditingController controller;
  const MyTextField(
      {required this.hintText,
      required this.onclick,
      required this.labelText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      child: TextFormField(
        controller: controller,
        onSaved: onclick(),
        decoration: InputDecoration(
          fillColor: const Color(0xFFC894D3),
          filled: true,
          labelText: labelText,
          labelStyle:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(color: Colors.black87)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(color: Colors.black87)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(color: Colors.black87)),
        ),
      ),
    );
  }
}
