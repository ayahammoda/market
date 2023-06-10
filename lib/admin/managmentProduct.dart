
// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:market1/color.dart';
import 'package:market1/constant.dart';

class MangmentProduct extends StatefulWidget {
  static String id = 'MangmentProduct';
  const MangmentProduct({Key? key}) : super(key: key);

  @override
  State<MangmentProduct> createState() => _MangmentProductState();
}

class _MangmentProductState extends State<MangmentProduct> {
  String? _categoryName;
  String? _categoryId;
  File? _image=File('');
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      _image = args[kProductImage];
      // _categoryName = args?[kCategoryName];
    }
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child:
            Image.network(
              _image?.path ?? '',
              // _image as String,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            height: size.height * .30,
            child: Column(
              children: [
                Container(
                  color: KText.withOpacity(.1),
                  //info product...
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(''),
                      //choose quantity add to card....
                    ],
                  ),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * .13),
                    GestureDetector(
                      child: SizedBox(
                        width: size.width * .03,
                        height: size.height * .03,
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
                                    // await document.reference.delete();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(width: size.width * .1),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, CategoryCH.id,
                        //     arguments: {
                        //       kcategoryId: document.id,
                        //       kCategoryName: data[kCategoryName],
                        //     },
      // );
                      },
                      child: SizedBox(
                        width: size.width * .03,
                        height: size.height * .03,
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
