import 'package:flutter/material.dart';
import 'package:market1/admin/categorychoice.dart';
import 'package:market1/color.dart';
import 'package:market1/constant.dart';
import 'package:market1/models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market1/services/store.dart';


class CategoryPage extends StatefulWidget {
  static String id = 'categoryPage';
   CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _store = Store();
  List<Categories> ca = [];

  int _tabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery
        .of(context)
        .size;
    double fontSizeSelected = siz.width * .055;
    double fontSizeUnSelected = siz.width * .05;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CategoryCH.id);
        },
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ));

    /*    //TODO here to view category
        body:StreamBuilder<QuerySnapshot>(
        stream:_store.loaCategory() ,
        builder: (context, snapshot){
          if (snapshot!=null) {
             List<Categories> cat=[];
            for (var doc in snapshot.data!.docs)
            {
             var data=doc.data;
              cat.add( Categories(cateName:data[]),
                  );

            }
            return  GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .9,
              ),
              itemCount: cat.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   // ProductInfo.id,
                    //   // arguments: _products[index],
                    // );
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "Assets/Images/im1.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: siz.width,
                          height: siz.height * .29,
                          color: KText.withOpacity(.1),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'name product',
                                  style: TextStyle(
                                    color: KText,
                                    fontSize: siz.width * .03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    color: KText,
                                    fontSize: siz.width * .03,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // color: mainText.withOpacity(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
              }
          else {
            return Text("Loading..");
          }
        },
      )
    ,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CategoryCH.id);
          },
          tooltip: 'Increment',
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ));
  }*/

  }
}
Widget textTab({
  required String text,
  required int tabBarIndex,
  required int index,
  required double fontSizeSelected,
  required double fontSizeUnSelected,
}) {
  return Text(
    text,
    style: TextStyle(
      color: tabBarIndex == index ? KText : unActiveTextColor,
      fontSize: tabBarIndex == index ? fontSizeSelected : fontSizeUnSelected,
    ),
  );
}
