import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final  _auth = FirebaseAuth.instance ;

  Future signup(String _email, String _password) async  //ToDo مشان ياخد الwait
  {try{
    //TODO حطيت await لانو الارجاع رح يكون null لانو التعليمة رح تاخد وقت لبين ما تخلص فبقلو يستنى لتخلص مشان ما يكون الارجاع null
    final  authResult = await _auth.createUserWithEmailAndPassword
      (email: _email, password: _password);
    return authResult;}catch(er){print("this is the error from signup function:$er");};
  }

  Future<UserCredential> signin(String _email, String _password) async {
    final authResult = await _auth.signInWithEmailAndPassword
      (email: _email, password: _password);
    return authResult;
  }
}
