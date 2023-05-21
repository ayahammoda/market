
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../constant.dart';
import 'package:market1/models/category.dart';

class Store
{
final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  addcategory(Categories category){
    _firestore.collection(kCategoryCollection).add(
      {
        kCategoryName : category.cateName,
      });
  }









}