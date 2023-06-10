import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  final  _auth = FirebaseAuth.instance ;
 final nameController=TextEditingController();
 final passwordController=TextEditingController();
 final emailController=TextEditingController();
  Future signup(String email, String password, String name ) async  //ToDo مشان ياخد الwait
  {
    //TODO حطيت await لانو الارجاع رح يكون null لانو التعليمة رح تاخد وقت لبين ما تخلص فبقلو يستنى لتخلص مشان ما يكون الارجاع null
      await _auth.createUserWithEmailAndPassword
        (
          email: email.trim(),
          password: password.trim(),
      );
        await FirebaseFirestore.instance.collection('users').add(
            {
              'name': name,
              'email': email,

            });
  }
  Future<Type> signin(String email, String password) async {
    await _auth.signInWithEmailAndPassword
      ( email: email.trim(),
      password: password.trim(),);


  await FirebaseFirestore.instance.collection('users').add(
  {
  'email':email,
  });
    return  UserCredential;
}


  // Future<void> addProduct(String price, String name, String description, String type, String quantity) async {
  //   try {
  //    // await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     await FirebaseFirestore.instance.collection('productCollection').add({
  //       'price': price.trim(),
  //       'name': name.trim(),
  //       'description': description.trim(),
  //       'type': type.trim(),
  //       'quantity': quantity.trim(),
  //     });
  //   } catch (e) {
  //     print('Error adding product: $e');
  //   }
  // }
}