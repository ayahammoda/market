import 'package:flutter/material.dart';
import 'package:market1/color.dart';
import 'package:market1/screens/signup_screen.dart';
import '../Widget/textfiled.dart';

class loginscreen extends StatelessWidget {
  final GlobalKey <FormState> _globalKey=GlobalKey<FormState>();
  static String id = 'loginscreen';

  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMaincolor,
      body: Form(
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
            textfiled( icon: Icons.email, hint: 'enter your email'),
            SizedBox(
              height: height*0.001,
            ),
            textfiled(hint: 'enter your password ', icon: Icons.lock),
            SizedBox(
              height: height*0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 20),
               child: ElevatedButton(
                  onPressed: ()
                  {
                    if( _globalKey.currentState!.validate()) {};
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
                  child: Text('Signup',style: TextStyle(
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

    );
  }
}







