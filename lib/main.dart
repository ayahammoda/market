import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market1/screens/login_screen.dart';
import 'package:market1/screens/signup_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: loginscreen.id,
      routes:
       {
        loginscreen.id: (context) => loginscreen(),
         signupscreen.id: (context) => signupscreen(),


       },
    );
    throw UnimplementedError();
  }
}
