import 'package:flutter/material.dart';
import 'package:market1/admin/productPage.dart';

class adminHome extends StatefulWidget {
  static String id = 'homePageAdmin';
  const adminHome({Key? key}) : super(key: key);

  @override
  State<adminHome> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  int _indexBottomBar = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        DefaultTabController(
          length: 2,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Color(0xFFC894D3),
              unselectedItemColor: Color(0xFFC1BDB8),
              type: BottomNavigationBarType.shifting,
              onTap: (index) {
                setState(() {
                  _indexBottomBar = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_business_outlined), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.camera_alt_outlined), label: ""),
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
    );
  }
}

List<Widget> _Pages = [
  const TabBarView(
    children: [
      ProductPage(),
      ProductPage(),
    ],
  ),
  Container(),
  Container(),
  Container(),
];
