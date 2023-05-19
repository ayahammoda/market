import 'package:flutter/material.dart';
import '../Widget/textfiled.dart';
import '../color.dart';

class signupscreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  static String id='signupscreen';
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMaincolor,
      body: Form(
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
            textfiled(hint: 'enter your name ', icon: Icons.perm_identity, onClick: (){},),
            SizedBox(
              height: height*0.001,
            ),
            textfiled( icon: Icons.email, hint: 'enter your email',onClick: (){},),
            SizedBox(
              height: height*0.001,
            ),
            textfiled(hint: 'enter your password ', icon: Icons.lock,onClick: (){},),
            SizedBox(
              height: height*0.02,
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
                    'Sign up',
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
                Text('Do have an account ? ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                  ) ,),
                GestureDetector(
                  onTap: (){
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

    );
  }
}
