import 'package:flutter/material.dart';
import 'package:market1/color.dart';

//TODO return show video because must take info from last page

class ProductInfo extends StatefulWidget {
  static String id = 'productInfo';
  const ProductInfo({Key? key}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          //get photo product..
          Container(
            width: size.width,
            height: size.height,
            child: Image.asset(
              "Assets/Images/im1.jpj",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            height: size.height * .30,
            child: Column(
              children: [
                Container(
                  color: KText.withOpacity(.1),
                  //info product...
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(''),
                      //choose quantity add to card....
                      Row(
                        children: [
                          ClipOval(
                            child: Material(
                              color: KB1.withOpacity(.5),
                              child: GestureDetector(
                                onTap: addTract,
                                child: SizedBox(
                                  width: size.width * .02,
                                  height: size.height * .03,
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ),
                          Text('$_quantity'),
                          ClipOval(
                            child: Material(
                              color: KB1.withOpacity(.5),
                              child: GestureDetector(
                                onTap: subTract,
                                child: SizedBox(
                                  width: size.width * .02,
                                  height: size.height * .03,
                                  child: const Icon(Icons.minimize_rounded),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //button add to card..
                ButtonTheme(
                  minWidth: size.width,
                  height: size.height * .1,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        // backgroundColor: textColor
                        ),
                    onPressed: () {},
                    child: const Text('ADD TO CART'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  subTract() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

//TODO may check if _quantity--; > than quantity in DB
  addTract() {
    setState(() {
      _quantity++;
    });
  }
}
