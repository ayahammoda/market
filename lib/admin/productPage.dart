import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market1/admin/addProduct.dart';
import 'package:market1/color.dart';
import 'package:market1/constant.dart';

class ProductPage extends StatefulWidget {
  static String id = 'productPage';

  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _tabBarIndex = 0;
  CollectionReference proColl =
      FirebaseFirestore.instance.collection(kProductCollection);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double fontSizeSelected = size.width * .055;
    double fontSizeUnSelected = size.width * .05;

    return SafeArea(
      child: Scaffold(
        // body: StreamBuilder<QuerySnapshot>(
        //   stream: proColl.snapshots(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text('Error: ${snapshot.error}');
        //     }
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return CircularProgressIndicator();
        //     }
        //
        //     return GridView.count(
        //       crossAxisCount: 2,
        //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //         Map<String, dynamic> data =
        //             document.data() as Map<String, dynamic>;
        //         return GridTile(
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: GestureDetector(
        //               onTap: () {
        //                 //TODO go to the next page (page info product)
        //                 // Navigator.pushNamed(
        //                 //   context,
        //                 //   ProductInfo.id,
        //                 //   arguments: _products[index],
        //                 // );
        //               },
        //               child: Stack(
        //                 children: [
        //                   Positioned.fill(
        //                     child: Image.asset(
        //                       //TODO insure from this
        //                       data[kProductImage],
        //                       fit: BoxFit.fill,
        //                     ),
        //                   ),
        //                   Positioned(
        //                     bottom: 0,
        //                     child: Container(
        //                       width: size.width,
        //                       height: size.height * .29,
        //                       color: KText.withOpacity(.1),
        //                       child: Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             Text(data[kProductName]),
        //                             Text(data[kProductType]),
        //                             Text(data[kProductPrice]),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       }).toList(),
        //     );
        //   },
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddProduct.id);
          },
          tooltip: 'Increment',
          backgroundColor: endc,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
