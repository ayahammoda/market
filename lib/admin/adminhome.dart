import 'package:flutter/material.dart';
import 'package:market1/admin/categoryPage.dart';
import 'package:market1/admin/productPage.dart';
import 'package:market1/color.dart';

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
                items:  [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_business_outlined), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_checkout), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: ""),
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
                    padding: EdgeInsets.fromLTRB(size.width * .015,
                        size.height * .015, size.width * .4, 0),
                    child: Text(
                      'MY Store',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const Icon(Icons.search_rounded),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * .035,
                    ),
                    child: const Icon(Icons.chat),
                  ),
                  const Icon(Icons.info_outline_rounded),
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
  Container(),
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
