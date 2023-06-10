import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market1/constant.dart';
import 'package:market1/models/category.dart';
import 'package:market1/models/product.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addcategory(Categories category) {
    _firestore.collection(kCategoryCollection).add({
      kCategoryName: category.cateName,
    });
  }



  addPoduct(Product product) {
    _firestore.collection(kProductCollection).add({
      kProductName: product.nameProduct,
      kProductPrice: product.priceProduct,
      kProductDescription: product.descriptionProduct,
      kProductCategory: product.categoryProduct,
      kProductImage: product.imageProduct,
      kProductQuantity: product.quantityProduct,
      kProductType: product.priceProduct,
    });
  }


}
