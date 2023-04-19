import 'package:flutter/material.dart';
import '../color.dart';

class textfiled extends StatelessWidget {

   String hint;
   IconData icon;
   Function onClick;
  String _errormassage ( String str)
  {
    switch(hint)
    {
      case 'enter your name ': return ' Name is empty ! ';
      case 'enter your password ': return ' password is empty ! ';
      case 'enter your email': return ' email is empty ! ';
    }
    return hint;
  }
  textfiled(   { required this.hint ,required this.icon,  required this.onClick , });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical:6),
      child:  TextFormField(
        //مشان تخلي يأرجعلي الخطأ نص
        validator:(value)
        {

           if (value!.isEmpty)
          {
             return _errormassage(hint);
          }
        } ,
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