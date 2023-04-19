import 'package:flutter/material.dart';

import '../Widget/textfiled.dart';

//import 'package:../Widget/textfield.dart';
//import 'package:buy_it/Widgets/custom_textfield.dart';

class AddProduct extends StatelessWidget {
  static String id = 'AddProduct';
  late String _name, _price, _description, _category;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  // double price;

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black38),
      backgroundColor: Color(0xFFB970CE),
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children:<Widget>[


            textfiled(
              onClick:(value){

                _name=value;
              },
              hint:"product name...",
         icon:Icons.list
              ,
                ),
            SizedBox(height:10),

            textfiled(

              hint:"product price ..."

              , icon:Icons.list,
            onClick: (value){
                _price=value;
            },),
            SizedBox(height:10),
            textfiled(

              hint:"product discription... "

              ,icon:Icons.list,
            onClick:(value){
                _description=value;
            }),
            SizedBox(height:10),
            textfiled(

              hint:"product category... "

              , icon:Icons.list,
            onClick:(value){
                _category=value;
            } ,),
            SizedBox(height:10),


            textfiled(

              hint:"product image... "

              , icon:Icons.list,
            onClick:(value){

            }  ,),
        SizedBox(height:20 ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.black38),
          onPressed: () {
            if(_globalKey.currentState!.validate()){
              _globalKey.currentState!.save();
              _globalKey.currentState!.reset();
            };

          },
          child: Text('ADD PRODUCT'),)
              ],
            ),
      ),

    );}}


