
import 'package:flutter/material.dart';
import 'package:market1/admin/addproduct.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, AddProduct.id);
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
    );
  }
}
