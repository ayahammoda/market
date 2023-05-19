import 'package:flutter/material.dart';
import '../Widget/textfiled.dart';
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
        backgroundColor: Color(0xFFB970CE),
        body: Form(
            key: _globalKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  textfiled(
                    onClick: (value) {
                      _items = value;
                    },
                    hint: " add the categories ",
                    icon: Icons.list
                    ,
                  )
                ],
            ),
        ),
    );
  }
}
  // double price;

// This widget is the root of your application.







