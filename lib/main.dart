import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market1/provider/modelHud.dart';
import 'package:market1/admin/adminhome.dart';
import 'package:market1/screens/login_screen.dart';
import 'package:market1/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:market1/admin/addProduct.dart';

import 'firebase_options.dart';

main()
async{
WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp (MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelHude>(
      create: ( context)=>ModelHude(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         initialRoute: loginscreen.id,
        routes:
         {
          loginscreen.id: (context) => loginscreen(),
           signupscreen.id: (context) => signupscreen(),
           adminHome.id:(context)=> const adminHome(),
           addProduct.id:(context)=> const addProduct() ,
         },
      ),
    );
    throw UnimplementedError();
  }
}
