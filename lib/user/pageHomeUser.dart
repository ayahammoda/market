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
        Scaffold(
          appBar: AppBar(),
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
        Material(
          child: Container(
            height: size.height * .15,
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
                  onTap: () {},
                  child: SizedBox(),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
          ),
        )
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
    color: KText,
  ),
  Container(
    width: 200,
    height: 200,
    color: Colors.deepOrange,
  ),
];
