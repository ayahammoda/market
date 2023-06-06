import 'package:flutter/material.dart';
import 'package:market1/color.dart';

class PageHomeUser extends StatefulWidget {
  static String id = 'homepage';
  const PageHomeUser({Key? key}) : super(key: key);

  @override
  State<PageHomeUser> createState() => _PageHomeUserState();
}

class _PageHomeUserState extends State<PageHomeUser> {
  int _bottomBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double fontSizeSelected = size.width * .055;
    double fontSizeUnSelected = size.width * .05;
    return Stack(
      children: [
        DefaultTabController(
          length: 4,
          // TODO load cate to tabs
          child: Scaffold(
            appBar: _bottomBarIndex == 0
                ? AppBar(
                    backgroundColor: backgroundColor,
                    elevation: 0,
                    bottom: TabBar(
                      indicatorColor: KText,
                      onTap: (value) {
                        setState(() {
                          _bottomBarIndex = value;
                        });
                      },
                      tabs: [
                        textTab(
                          text: "category",
                          tabBarIndex: _bottomBarIndex,
                          index: 0,
                          fontSizeSelected: fontSizeSelected,
                          fontSizeUnSelected: fontSizeUnSelected,
                        ),
                        textTab(
                          text: "Product",
                          tabBarIndex: _bottomBarIndex,
                          index: 1,
                          fontSizeSelected: fontSizeSelected,
                          fontSizeUnSelected: fontSizeUnSelected,
                        ),
                      ],
                    ),
                  )
                : AppBar(),
            body: _pages[_bottomBarIndex],
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                unselectedItemColor: KText,
                currentIndex: _bottomBarIndex,
                fixedColor: KB1,
                onTap: (value) {
                  setState(
                    () {
                      _bottomBarIndex = value;
                    },
                  );
                },
                items: const [
                  BottomNavigationBarItem(
                    label: 'home Page',
                    icon: Icon(Icons.home_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: 'My Cart',
                    icon: Icon(Icons.shopping_cart),
                  ),
                  BottomNavigationBarItem(
                    label: 'Favorite',
                    icon: Icon(Icons.favorite_border_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: 'My Profile',
                    icon: Icon(Icons.person_pin),
                  ),
                ]),
          ),
        ),
        Container(
          height: size.height * .1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  size.width * .015,
                  size.height * .015,
                  size.width * .4,
                  0,
                ),
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
      ],
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

List<Widget> _pages = [
  const TabBarView(
    children: [
      // ViewProducts(),
      // ViewProducts(),
      // ViewProducts(),
      // ViewProducts(),
    ],
  ),
  Container(
    width: 200,
    height: 200,
    color: KText,
  ),
  Container(
    width: 200,
    height: 200,
    color: KText,
  ),
  Container(
    width: 200,
    height: 200,
    color: Colors.deepOrange,
  ),
];
