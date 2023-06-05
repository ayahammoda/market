import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market1/admin/adminhome.dart';
import 'package:market1/provider/modelHud.dart';
import 'package:market1/screens/login_screen.dart';
import 'package:market1/screens/login_valid.dart';
import 'package:provider/provider.dart';
import '../Widget/textfiled.dart';
import '../color.dart';
import 'package:market1/services/auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


class signupscreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  final _auth=Auth();
  static String id='signupscreen';
 // String email, password, name;
 TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kMaincolor,
        body: ModalProgressHUD(
          //todo بتحدد اذا هية ظاهرة او لا (اشارة التحميل بين ما يعمل signup) inAsyncCall
          //todo  Provider من خلال ال  isloading منوصل لل
          inAsyncCall: Provider.of<ModelHude>(context).isloading,
          child: Form(
            key: _globalKey,
            child: ListView(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 70),
                    child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.2,
                        width:  10,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image
                              (image: AssetImage(
                                'asset/images/icons/icons8-store.png'),),
                            Positioned(
                                bottom: 0,
                                child: Text('Welcome to market',
                                  style: TextStyle(
                                      fontFamily: 'pacifico',
                                      fontSize: 25,
                                      color: KText

                                  )
                                  ,)
                            )
                          ],
                        )
                    )  ),
                SizedBox(
                  height: height*0.07,
                ),
                AppTextFiled(hint: 'enter your name ', icon: Icons.perm_identity,
                 controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) =>LoginValidator.validatename(value),
                ),
                SizedBox(
                  height: height*0.001,
                ),
                AppTextFiled( icon: Icons.email, hint: 'enter your email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => LoginValidator.validateEmail(value),
                  ),
                SizedBox(
                  height: height*0.001,
                ),
                AppTextFiled(hint: 'enter your password ', icon: Icons.lock,
                 controller: passwordController,
                  obs: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) =>LoginValidator.validatePassword(value),),
                SizedBox(
                  height: height*0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 20),
                  child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                          onPressed: () async
                          {
                            if (_globalKey.currentState!.validate()) {
                              final authResult= await _auth.signup(emailController.text,
                                  passwordController.text,nameController.text);
                              _globalKey.currentState!.save();
                          try {

                          Navigator.pushNamed(context,loginscreen.id);
                          print(authResult);

                          //  print(authResult.user?.uid);
                          }   catch (e) {
                          print(e.toString());
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(
                          e.toString() )

                          )
                          );//
                          }
                              };
                            //todo بدي ياها تختفي لانو اذا طلع ايرور رح تضل موجودة
                            },
                            style:
                            ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                backgroundColor: Colors.black87,
                                side: const BorderSide(
                                  width: 3,
                                  color: Colors.black87,
                                )
                            ),

                            child: Text(
                            'Sign up',
                            style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Alkatra',
                          ) )
                      );
                    }
                  ),
                ),
                SizedBox(
                  height: height*0.003,
                ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text('Do have an account ? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17
                      ) ,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, loginscreen.id);
                      },
                      child: Text(
                        'Login',style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ) ,),
                    )
                  ],
                )
              ],
              // color: Colors.amberAccent,
            ),
          ),
        ),

      );
  }
}
