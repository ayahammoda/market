import 'package:flutter/material.dart';

//import 'package:market1/screens/login_valid.dart';
import '../color.dart';

class AppTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
 final String? Function(String?)? validator;
  final  TextInputType? keyboardType;
  final Function? onClick;
  bool obs =false;


  AppTextFiled( { required this.controller,this.obs=false, required this.hint,required this.icon, this.validator, this.keyboardType, this.onClick, });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical:6),
      child:  TextFormField(
        controller: controller,
        validator: validator,
        obscureText:obs ,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: KText,
            ),

            filled: true,
            fillColor: KB1,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(
                    color: Colors.black87
                )
            ),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(
                    color: Colors.black87
                )
            ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(
                  color: Colors.black87
              )
          ),

        ),



      ),
    );

  }
}