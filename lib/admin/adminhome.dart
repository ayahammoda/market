import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market1/admin/categoryPage.dart';
import 'package:market1/admin/productPage.dart';
import 'package:market1/color.dart';
import 'package:market1/constant.dart';
import 'package:market1/profilePage.dart';

class adminHome extends StatefulWidget {
  static String id = 'homePageAdmin';

  const adminHome({Key? key}) : super(key: key);

  @override
  State<adminHome> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  int _indexBottomBar = 0;
  int _tabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double fontSizeSelected = size.width * .055;
    double fontSizeUnSelected = size.width * .05;

    return SafeArea(
      child: Stack(
        children: [
          DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: _indexBottomBar == 0
                  ? AppBar(
                      backgroundColor: backgroundColor,
                      elevation: 0,
                      bottom: TabBar(
                        indicatorColor: KText,
                        onTap: (value) {
                          setState(() {
                            _tabBarIndex = value;
                          });
                        },
                        tabs: [
                          textTab(
                            text: "category",
                            tabBarIndex: _tabBarIndex,
                            index: 0,
                            fontSizeSelected: fontSizeSelected,
                            fontSizeUnSelected: fontSizeUnSelected,
                          ),
                          textTab(
                            text: "Product",
                            tabBarIndex: _tabBarIndex,
                            index: 1,
                            fontSizeSelected: fontSizeSelected,
                            fontSizeUnSelected: fontSizeUnSelected,
                          ),
                        ],
                      ),
                    )
                  : AppBar(),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: KB1,
                unselectedItemColor: KText,
                type: BottomNavigationBarType.shifting,
                onTap: (index) {
                  setState(() {
                    _indexBottomBar = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_business_outlined), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_checkout), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                ],
              ),
              backgroundColor: Color(0xFFB970CE),
              body: _Pages[_indexBottomBar],
            ),
          ),
          Material(
            child: Container(
              height: size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * .015, 0, size.width * .60, 0),
                    child: Text(
                      'MY Store',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String categoryName =
                          'category name'; // replace with the desired category name

                      QuerySnapshot snapshot = await FirebaseFirestore.instance
                          .collection(kCategoryCollection)
                          .where(kCategoryName, isEqualTo: categoryName)
                          .get();

                      if (snapshot.docs.isNotEmpty) {
                        // loop through the documents in the snapshot to get the category data
                        for (var doc in snapshot.docs) {
                          var categoryId = doc.id;
                          var categoryName = doc[kCategoryName];
                          // do something with the category data, such as displaying it in a list or updating it
                        }
                      } else {
                        print('No matching documents found');
                      }
                    },
                    child: SizedBox(),
                  ),
                  // IconButton(onPressed:(){
                  //   showSearch(context: context, delegate:null);
                  // }
                  //     , icon: const Icon( Icons.search))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> _Pages = [
  TabBarView(
    children: [
      CategoryPage(),
      ProductPage(),
    ],
  ),
  Container(),
  StoreProfilePage(),
];

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
// class CustomerSearch extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return[IconButton(onPressed:() {query='';},
//         icon:const Icon(Icons.clear))];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(onPressed:() {close(context, null);},
//         icon:const Icon(Icons.arrow_back));
//   }
//
// }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     throw UnimplementedError();
//   }
// }
