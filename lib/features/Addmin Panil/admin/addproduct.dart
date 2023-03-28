import 'package:flutter/material.dart';
//import 'package:../Widget/textfield.dart';
//import 'package:buy_it/Widgets/custom_textfield.dart';

class AddProduct extends StatelessWidget {
  static String id = 'AddProduct';

 // double price;

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB970CE),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:100)),
       Container(

         margin:EdgeInsets.all(20.0) ,
        child:TextField(

            decoration: InputDecoration(
              fillColor: Color(0xFFC894D3),
              filled: true,
          labelText: "Product Name",
          labelStyle: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),
          hintText: "Enter the product name ",
        ))),SizedBox(height:0.07),
        Container(
          margin:EdgeInsets.all(20.0) ,
         child:TextField(
           onTap: (){},
          decoration: InputDecoration(
            fillColor: Color(0xFFC894D3),
            filled: true,
            labelText: "Product Price,",
            labelStyle: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),
            hintText: "Enter the product price ",
           border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(8.0) ,
            ) ),keyboardType: TextInputType.number,
          ),

        ),SizedBox(height:0.07),
      Container(
        margin:EdgeInsets.all(20.0) ,
          child: TextField(

            decoration: InputDecoration(
              fillColor: Color(0xFFC894D3),
              filled: true,
          labelText: "Product Description",
              labelStyle: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),
          hintText: "Enter the price of the product ",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(8.0) ,
        ))),),
        SizedBox(height:0.07),
      Container(
        margin:EdgeInsets.all(20.0) ,
          child:TextField(
            decoration: InputDecoration(
              fillColor: Color(0xFFC894D3),
              filled: true,
          labelText: "Product Category",
              labelStyle: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),
          hintText: "Enter the category of the product  ",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(8.0) ,

        ))),),
        SizedBox(height:0.07),
      Container(
        margin:EdgeInsets.all(20.0) ,
          child:TextField(
            decoration: InputDecoration(
              fillColor: Color(0xFFC894D3),
              filled: true,
          labelText: "Product Image ",
              labelStyle: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),
          hintText: "Enter the product location   ",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(8.0) ,
        ))),),
        SizedBox(height:0.07),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black38),
              onPressed:(){} ,
              child:Text('ADD PRODUCT')
              ,
            ),
      ]),
    );
  }
}
