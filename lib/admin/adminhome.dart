import 'package:flutter/material.dart';
import 'package:market1/admin/addproduct.dart';
import 'package:market1/admin/data.dart';
import 'package:market1/main.dart';
class adminHome extends StatefulWidget {
  static String id='homePabeAdmin';
  const adminHome({Key? key}) : super(key: key);

  @override
  State<adminHome> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  int _indexBottomBar = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xFFC894D3),
          unselectedItemColor: Color(0xFFC1BDB8),
          type:BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              _indexBottomBar = index;
            });
          }
          , items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_business_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],),

        backgroundColor: Color(0xFFB970CE),
        body: _Pages[_indexBottomBar],
      ),);
  }

}
List<Widget> _Pages=[
Data(),
  Container(),
  Container(),
  Container(),
];
