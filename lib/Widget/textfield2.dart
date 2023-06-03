import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final String hintText;
  final Function onclick;
  final String labelText;

  const myTextField(
      {Key? key,
      required this.hintText,
      required this.onclick,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        onTap: onclick(),
        decoration: InputDecoration(
          fillColor: Color(0xFFC894D3),
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Colors.black87)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Colors.black87)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Colors.black87)),
        ));
  }
}
