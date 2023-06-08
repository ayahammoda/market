 import 'package:flutter/material.dart';
import 'package:market1/color.dart';




class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  static String id = 'CartPage';
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
          backgroundColor:endc,
        title: Text('MyCart'),
      ), body:Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(child: Container()), // add this to push the button to the bottom
            ButtonTheme(
                minWidth: size.width,
                height: size.height * .1,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('ORDER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: endc,
                    ),)

            ),

          ],
        ),)



    ));
  }
}
