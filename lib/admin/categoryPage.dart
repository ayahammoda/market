import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market1/admin/categorychoice.dart';
import 'package:market1/color.dart';
import 'package:market1/constant.dart';
//import 'package:market1/constants/store.dart';

class CategoryPage extends StatefulWidget {
  static String id = 'categoryPage';
  CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CollectionReference usersRef =
      FirebaseFirestore.instance.collection(kCategoryCollection);

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    double fontSizeSelected = siz.width * .055;
    double fontSizeUnSelected = siz.width * .05;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return GridView(
            //crossAxisCount: 2,

            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: siz.width,
                        height: siz.height * .08,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [startc, endc],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: GridTile(
                          child: Center(
                              child: Text(
                            data[kCategoryName],
                            style: TextStyle(fontSize: siz.height * .025),
                          )),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: siz.width * .02,
                              height: siz.height * .03,
                              child: const Icon(Icons.delete),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: siz.width * .02,
                              height: siz.height * .03,
                              child: const Icon(Icons.edit),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            }).toList(),
          );
        },
      ),

      //TODO here to view category

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CategoryCH.id);
        },
        tooltip: 'Increment',
        backgroundColor: endc,
        child: const Icon(Icons.add),
      ),
    );
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
