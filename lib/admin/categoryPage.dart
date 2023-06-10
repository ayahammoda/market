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
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: siz.height * .02,
                mainAxisSpacing: siz.width * .02,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot document = snapshot.data!.docs[index];
                final Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        width: siz.width,
                        height: siz.height * .09,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
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
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: siz.width * .13),
                            GestureDetector(
                              child: SizedBox(
                                width: siz.width * .03,
                                height: siz.height * .03,
                                child: const Icon(Icons.delete),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    var dialogSize =
                                        MediaQuery.of(context).size;
                                    return AlertDialog(
                                      title: const Text('Are you sure?'),
                                      content: const Text(
                                          'Do you want to delete this category?'),
                                      actions: [
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Delete'),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await document.reference.delete();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            SizedBox(width: siz.width * .1),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, CategoryCH.id,
                                    arguments: {
                                      kcategoryId: document.id,
                                      kCategoryName: data[kCategoryName],
                                    });
                              },
                              child: SizedBox(
                                width: siz.width * .03,
                                height: siz.height * .03,
                                child: const Icon(Icons.edit),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
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
