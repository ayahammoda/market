import 'package:flutter/material.dart';
import 'package:market1/admin/addProduct.dart';
import 'package:market1/admin/adminhome.dart';

class ProductPage extends StatefulWidget {
  static String id = 'productPage';

  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _tabBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    double fontSizeSelected = siz.width * .055;
    double fontSizeUnSelected = siz.width * .05;

    return SafeArea(
      child: Scaffold(
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, adminHome.id);
          },
          tooltip: 'Increment',
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
