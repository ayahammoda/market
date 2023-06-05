import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market1/admin/adminhome.dart';
import 'package:market1/color.dart';
import 'package:market1/screens/login_valid.dart';
import 'package:market1/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import '../Widget/textfiled.dart';
import 'package:market1/services/auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//import 'package:market1/admin/movePages.dart';

import '../provider/modelHud.dart';

class loginscreen extends StatelessWidget {
  final GlobalKey <FormState> _globalKey=GlobalKey<FormState>();
  final _auth=Auth();
  static String id = 'loginscreen';
   late String _email, _password;
   TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMaincolor,
      body:  ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHude>(context).isloading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 100),
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
              AppTextFiled( icon: Icons.email, hint: 'enter your email',
                controller: emailController,
                 onClick:(value){
                  _email=value;
                 },
                keyboardType: TextInputType.emailAddress,
                validator: (value) => LoginValidator.validateEmail(value),
                 ),
              SizedBox(
                height: height*0.001,
              ),

                AppTextFiled(hint: 'enter your password ', icon: Icons.lock,
                  controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                   validator: (value) =>LoginValidator.validatePassword(value),
                     obs: true,
                  ),

              SizedBox(
                height: height*0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 20),
                 child: Builder(
                   builder: (context) {
                     return ElevatedButton(
                        onPressed: () async
                        {
                          if (_globalKey.currentState!.validate()) {
                          final result = await _auth.signin(emailController.text, passwordController.text);
                            _globalKey.currentState!.save();
                            try {
                                  if( emailController.text == 'aya200@gmail.com'){
                                  Navigator.pushNamed(context, adminHome.id);
                                }
                                  else print('page client');
                              print(result);
                             // Navigator.pushNamed(context, adminHome.id);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          e.toString())
                                  ));
                            }
                          };
                        },
                         style: ElevatedButton.styleFrom(
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
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Alkatra',
                          ),
                        )
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
                  Text('dont have an account ? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ) ,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, signupscreen.id);
                    },
                    child: Text('Signup',
                      style: TextStyle(
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









