import 'package:flutter/material.dart';
import 'package:market1/admin/addProduct.dart';
import 'package:market1/color.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _tabBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    double fontSizeSelected = siz.width * .029;
    double fontSizeUnSelected = siz.width * .028;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        bottom: TabBar(
          indicatorColor: KText,
          onTap: (value) {
            setState(() {
              _tabBarIndex = value;
            });
          },
          tabs: [
            textTab(
              text: "category",
              tabBarIndex: _tabBarIndex,
              index: 0,
              fontSizeSelected: fontSizeSelected,
              fontSizeUnSelected: fontSizeUnSelected,
            ),
            textTab(
              text: "category",
              tabBarIndex: _tabBarIndex,
              index: 1,
              fontSizeSelected: fontSizeSelected,
              fontSizeUnSelected: fontSizeUnSelected,
            ),
            // textTab(
            //   text: "category",
            //   tabBarIndex: _tabBarIndex,
            //   index: 2,
            //   fontSizeSelected: fontSizeSelected,
            //   fontSizeUnSelected: fontSizeUnSelected,
            // ),
            // textTab(
            //   text: "Product",
            //   tabBarIndex: _tabBarIndex,
            //   index: 3,
            //   fontSizeSelected: fontSizeSelected,
            //   fontSizeUnSelected: fontSizeUnSelected,
            // ),
          ],
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProduct.id);
        },
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget textTab({
  required String text,
  required int tabBarIndex,
  required int index,
  required double fontSizeSelected,
  required double fontSizeUnSelected,
}) {
  return Text(
    text,
    style: TextStyle(
      color: tabBarIndex == index ? KText : unActiveTextColor,
      fontSize: tabBarIndex == index ? fontSizeSelected : fontSizeUnSelected,
    ),
  );
}
