import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market1/Widget/textfiled.dart';

// import 'package:image_picker/image_picker.dart';
import 'package:market1/color.dart';
import 'package:market1/constant.dart';

class AddProduct extends StatefulWidget {
  static String id = 'AddProduct03';

  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _name = '', _type = '', _description = '';
  int _price = 0, _quantity = 0;
  String? selectedCate;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _storage = FirebaseStorage.instance;

  //Future<void> _setData

  displayMessage(String Message) {
    Text(Message);
  }

  File _image = File('');
  final picker = ImagePicker();
  late Reference _storageReference;

  Future uploadImage(File _image1) async {
    String url;
    String imageId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance.ref().child('product$imageId');
    await ref.putFile(_image1);
    url = await ref.getDownloadURL();
    return url;
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else
          displayMessage('noooo');
      });
    } on PlatformException {
      displayMessage('noooo2');
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else
          displayMessage('noooo');
      });
    } on PlatformException {
      displayMessage('noooo2');
    }
  }

  TextEditingController productController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: KText),
        backgroundColor: backgroundColor,
        body: Form(
          key: _globalKey,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppTextFiled(
                icon: Icons.email, hint: 'enter your name',
                controller: productController,
                // keyboardType: TextInputType.emailAddress,
                // hintText: "product name...",
                // validator: (value) => LoginValidator.validateEmail(value),
              ),
              // myTextField(
              //   onclick: () {
              //     (value) => _name = value;
              //   },
              //   hintText: "product name...",
              //   labelText: 'product name',
              // ),
              SizedBox(height: 10),
              myTextField(
                onclick: () {
                  (value) => _type = value;
                },
                hintText: "product Type...",
                labelText: 'product Type',
              ),
              SizedBox(height: 10),
              myTextField(
                onclick: () {
                  (value) => _price = value!;
                },
                hintText: "product price...",
                labelText: 'product price',
              ),
              SizedBox(height: 10),
              myTextField(
                onclick: () {
                  (value) => _quantity = value!;
                },
                hintText: "product quantity...",
                labelText: 'product quantity',
              ),
              SizedBox(height: 10),
              myTextField(
                onclick: () {
                  (value) => _description = value!;
                },
                hintText: "product discription...",
                labelText: 'product discription',
              ),
              SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(kCategoryCollection)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  List<DropdownMenuItem> items = snapshot.data!.docs.map((doc) {
                    return DropdownMenuItem(
                      value: doc.id,
                      child: Text(doc[kCategoryName]),
                    );
                  }).toList();
                  return DropdownButton(
                    items: items,
                    onChanged: (value) {
                      setState(() {
                        selectedCate = value!;
                      });
                      // Handle the onChanged event here.
                    },
                    value: selectedCate, // Set the default value to null.
                    hint: Text("Select an item"),
                  );
                },
              ),
              SizedBox(height: 10),
              SizedBox(height: 16.0),
              Container(
                color: Colors.red,
                child: GestureDetector(
                  child: Text('ADD IMAGR'),
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text("Gallery"),
                                  onTap: () {
                                    _pickImageFromGallery();
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: Text("Camera"),
                                  onTap: () {
                                    _pickImageFromCamera();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Add Product',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    final imgUrl = await uploadImage(_image);
                    FirebaseFirestore.instance
                        .collection(kProductCollection)
                        .add({
                      kProductName: _name,
                      kProductType: _type,
                      kProductPrice: _price,
                      kProductQuantity: _quantity,
                      kProductDescription: _description,
                      kProductCategory: selectedCate,
                      kProductImage: imgUrl,
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myTextField({
    required String hintText,
    required String labelText,
    required Function onclick,
  }) {
    return TextFormField(
      onSaved: onclick(),
      decoration: InputDecoration(
        fillColor: startc,
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.black87)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.black87)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Colors.black87)),
      ),
    );
  }
}
