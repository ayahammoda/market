import 'package:flutter/material.dart';
import 'package:market1/color.dart';
import '../Widget/textfield2.dart';
class CategoryCH extends StatefulWidget {
  static String id = 'CategoryCH';

  const CategoryCH({Key? key}) : super(key: key);

  @override
  State<CategoryCH> createState() => _CategoryCHState();
}

class _CategoryCHState extends State<CategoryCH> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late String _items ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(backgroundColor: Colors.black38),
        backgroundColor: backgroundColor,
        body: Form(
            key: _globalKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  myTextField(

                  onclick:(value){

                    _items=value;
                  },
                  hintText:"enter the category name ",
                  labelText: 'category name',
                ),

                ],
            ),
        ),
    );
  }
}
  // double price;

// This widget is the root of your application.







