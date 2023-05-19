import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market1/provider/modelHud.dart';
import 'package:market1/screens/login_screen.dart';
import 'package:market1/screens/login_valid.dart';
import 'package:provider/provider.dart';
import '../Widget/textfiled.dart';
import '../color.dart';
import 'package:market1/services/auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';


class signupscreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  final _auth=Auth();
  static String id='signupscreen';
   late String _email, _password, name;
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
                  onClick: (value){ name=value; },
                  keyboardType: TextInputType.name,
                  validator: (value) =>LoginValidator.validatename(value),
                ),
                SizedBox(
                  height: height*0.001,
                ),
                AppTextFiled( icon: Icons.email, hint: 'enter your email',
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
                  onClick: (value)
                   { _password= value;},
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
                            final modehud =  Provider.of<ModelHude>(context,listen: false);
                            modehud.changeisloadiing(true);
                            if (_globalKey.currentState!.validate()) {
                              try {
                                _globalKey.currentState!.save();
                                print(_email);
                                print(_password);
                                final authResult = await _auth.signup(
                                    _email, _password);
                                modehud.changeisloadiing(false);
                                //todo عند لين وبتول
                                //Navigator.pushNamed(context, HomePage.id);
                             //  print(authResult.user?.uid);
                              }  on PlatformException catch (e) {
                                modehud.changeisloadiing(false);
                              //  print(e.toString());
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                          e.message.toString() )
                                    ));
                               }
                              };
                            //todo بدي ياها تختفي لانو اذا طلع ايرور رح تضل موجودة
                            modehud.changeisloadiing(false);
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
