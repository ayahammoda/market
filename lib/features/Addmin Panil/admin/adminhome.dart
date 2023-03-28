import 'package:flutter/material.dart';
import 'package:market1/features/Addmin%20Panil/admin/addproduct.dart';

//import 'package:provider/provider.dart';


class AdminHome extends StatelessWidget {
  static String id = "leen";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

         backgroundColor: Color(0xFFB970CE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () {


            //  Navigator.pushNamed(context,AddProduct());

            },
            child: Text(
              'ADD PRODUCT',
              style: TextStyle(color: Colors.black),
            ),

          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () {},
            child: Text(
              'EDIT PRODUCT',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {},
              child: Text(
                'VIEW ORDERS',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
    );
  }
}
