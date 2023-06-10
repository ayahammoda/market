
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _nameCate = '';
  String? _categoryName;
  String? _categoryId;
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      _categoryId = args?[kcategoryId];
      _categoryName = args?[kCategoryName];
    }
    // Object? cate = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(backgroundColor: endc),
      backgroundColor: backgroundColor,
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onSaved: (value) {
                _nameCate = value!;
              },
              decoration: InputDecoration(
                fillColor: startc,
                filled: true,
                labelText: 'Category Name',
                labelStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();

                if (_categoryId != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                content: Text('Category updated successfully'),
                backgroundColor: Colors.lightBlueAccent,
                ),
                );
                Navigator.pop(context);
                await _firestore
                    .collection(kCategoryCollection)
                    .doc(_categoryId)
                    .update({kCategoryName: _nameCate});
                } else {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                content: Text('Category added successfully'),
                backgroundColor: Colors.lightBlueAccent,
                ),
                );
                Navigator.pop(context);
                await _store.addcategory(Categories(
                cateName: _nameCate,
                ));
                }
              }
              },
              child: Text(_categoryId != null ? 'Update' : 'ADD'),
              style: ElevatedButton.styleFrom(
                primary: endc,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            // child: const Text('EDIT'),
          ],
        ),
      ),
    );
  }
}