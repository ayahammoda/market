import 'package:flutter/material.dart';
import 'package:market1/admin/categorychoice.dart';
import 'package:market1/color.dart';

class CategoryPage extends StatefulWidget {
  static String id = 'categoryPage';
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _tabBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    double fontSizeSelected = siz.width * .055;
    double fontSizeUnSelected = siz.width * .05;

    return Scaffold(
        //TODO here to view category
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CategoryCH.id);
          },
          tooltip: 'Increment',
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ));
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
