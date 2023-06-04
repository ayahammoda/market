import 'package:flutter/material.dart';
import 'package:market1/admin/categoryPage.dart';
import 'package:market1/color.dart';
import 'package:market1/constant.dart';
import 'package:market1/models/category.dart';
import 'package:market1/services/store.dart';

class CategoryCH extends StatefulWidget {
  static String id = 'CategoryCH';

  const CategoryCH({Key? key}) : super(key: key);

  @override
  State<CategoryCH> createState() => _CategoryCHState();
}

class _CategoryCHState extends State<CategoryCH> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
    String _nameCate='';
    String _items='';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _store = Store();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black38),
        backgroundColor: backgroundColor,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: [
              SizedBox(
                height: size.height * .35,
              ),
              TextFormField(
                onSaved: (value) {
                  _nameCate=value!;
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xFFC894D3),
                  filled: true,
                  labelText: 'Category Name',
                  labelStyle: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  hintText: 'enter category Name here...',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.black87)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.black87)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.black87)),
                ),
              ),
              SizedBox(
                height: size.height * .35,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kMaincolor,
                  foregroundColor: KText,
                ),
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    _globalKey.currentState!.reset();
                    _store.addcategory(Categories(cateName:_nameCate

                    ));
                  }
                  Navigator.pushNamed(context, CategoryPage.id);
                },
                child: const Text('ADD'),
              ),
            ],
          ),
          // MyTextField(
          //   hintText: "enter the category name ",
          //   labelText: 'category name',
          //   onclick: (value) {
          //     _items = value;
          //   },
          // ),
        ),
      ),
    );
  }
}
// double price;

// This widget is the root of your application.
// Widget myTextField({
//   required String hintText,
//   required String labelText,
//   required Function onClick,
// }) {
//   return TextFormField(
//     onTap: onClick(),
//     decoration: InputDecoration(
//       fillColor: const Color(0xFFC894D3),
//       filled: true,
//       labelText: labelText,
//       labelStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//       hintText: hintText,
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(100),
//           borderSide: const BorderSide(color: Colors.black87)),
//       focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(100),
//           borderSide: const BorderSide(color: Colors.black87)),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(100),
//           borderSide: const BorderSide(color: Colors.black87)),
//     ),
//   );
// }
