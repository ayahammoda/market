import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market1/models/category.dart';

import '../constant.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addcategory(Categories category) {
    _firestore.collection(kCategoryCollection).add({
      kCategoryName: category.cateName,
    });
  }
}
