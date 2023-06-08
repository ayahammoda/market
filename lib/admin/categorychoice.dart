import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market1/admin/adminhome.dart';
import 'package:market1/color.dart';
import 'package:market1/constant.dart';
import 'package:market1/services/store.dart';

class CategoryCH extends StatefulWidget {
  static String id = 'CategoryCH';

  const CategoryCH({Key? key}) : super(key: key);

  @override
  State<CategoryCH> createState() => _CategoryCHState();
}

class _CategoryCHState extends State<CategoryCH> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late String _items;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _nameCate = '';
  final _store = Store();
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: endc,
                foregroundColor: KText,
              ),
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();
                  _globalKey.currentState!.reset();
                  _firestore.collection(kCategoryCollection).add({
                    kCategoryName: _nameCate,
                  });
                }
                Navigator.pushNamed(context, adminHome.id);
              },
              child: Text('ADD'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: endc,
                foregroundColor: KText,
              ),
              onPressed: () async {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();
                  _globalKey.currentState!.reset();
                  QuerySnapshot snapshot = await FirebaseFirestore.instance
                      .collection(kCategoryCollection).get();
                      // .where(kCategoryName, isEqualTo: _nameCate)
                      // .get();
                  if (snapshot.docs.isEmpty) {
                    var cat= await _firestore.collection(kCategoryCollection).where(kCategoryName, isEqualTo: snapshot).get();
                    if(cat.docs.isNotEmpty){
                      var categoryId = cat.docs.first.id;
                    }
                    print('No matching documents found');
                  } else {

                    String categoryId = snapshot.docs.first.id;
                    try {

                      await _firestore
                          .collection(kCategoryCollection)
                          .doc(categoryId)
                          .update({kCategoryName: _nameCate});
                      print('Category updated successfully!');
                    } catch (e) {
                      print('Error updating category: $e');
                    }
                  }

                }
                Navigator.pushNamed(context, adminHome.id);
              },
              child: const Text('EDIT'),
            ),
          ],
        ),
      ),
    );
  }
}
// double price;

// This widget is the root of your application.
