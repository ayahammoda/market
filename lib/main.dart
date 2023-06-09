import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market1/admin/addProduct.dart';
import 'package:market1/admin/adminhome.dart';
import 'package:market1/admin/categoryPage.dart';
import 'package:market1/admin/categorychoice.dart';
import 'package:market1/admin/managmentProduct.dart';
import 'package:market1/admin/productPage.dart';
import 'package:market1/profilePage.dart';
import 'package:market1/provider/modelHud.dart';
import 'package:market1/screens/login_screen.dart';
import 'package:market1/screens/signup_screen.dart';
import 'package:market1/user/InfoProductPage.dart';
import 'package:market1/user/pageHomeUser.dart';
import 'package:market1/user/userCartPage.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelHude>(
      create: (context) => ModelHude(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: loginscreen.id,
        routes: {
          loginscreen.id: (context) => loginscreen(),
          signupscreen.id: (context) => signupscreen(),
          StoreProfilePage.id: (context) => StoreProfilePage(),
          adminHome.id: (context) => const adminHome(),
          AddProduct.id: (context) => const AddProduct(),
          CategoryPage.id: (context) => CategoryPage(),
          ProductPage.id: (context) => const ProductPage(),
          CategoryCH.id: (context) => const CategoryCH(),
          PageHomeUser.id: (context) => const PageHomeUser(),
          CartPage.id: (context) => CartPage(),
          ProductInfo.id:(context)=>ProductInfo(),
          MangmentProduct.id:(context)=>MangmentProduct(),
        },
      ),
    );
    throw UnimplementedError();
  }
}
