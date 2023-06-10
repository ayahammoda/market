import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
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

  // Map<String, dynamic>? _storeData;

  //bool _isLoading = true;
  //User? _user;
  final GlobalKey<FormBuilderState> _globalKey = GlobalKey<FormBuilderState>();

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //final _storage = FirebaseStorage.instance;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController productnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  void initState() {
    super.initState();
    //  _getCurrentUser();
  }

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
             // AppTextFiled(
             //   icon: Icons.email, hint: 'enter your name',
              //  controller: productController,
                // keyboardType: TextInputType.emailAddress,
                // hintText: "product name...",
                // validator: (value) => LoginValidator.validateEmail(value),

               myTextField(
                 controller: productnameController,
                onclick: () {
                  (value) => _name = value;
                },
                hintText: "product name...",
                labelText: 'product name',
              ),
              SizedBox(height: 10),
              myTextField(
                controller: typeController,
                onclick: () {
                  (value) => _type = value;
                },
                hintText: "product Type...",
                labelText: 'product Type',
              ),
              SizedBox(height: 10),
              myTextField(
                controller: priceController,
                onclick: () {
                  (value) => _price = value;
                },
                hintText: "product price...",
                labelText: 'product price',
              ),
              SizedBox(height: 10),
              myTextField(
                controller: quantityController,
                onclick: () {
                  (value) => _quantity = value;
                },
                hintText: "product quantity...",
                labelText: 'product quantity',
              ),
              SizedBox(height: 10),
              myTextField(
                controller: descriptionController,
                onclick: () {
                  (value) => _description = value;
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
                        selectedCate = value;
                      });
                      // Handle the onChanged event here.
                    },
                    value: selectedCate,

                    // Set the default value to null.
                    hint: Text("Select an item"),


                  ); },
            ),
            SizedBox(height: 10),
            Container(
              // color: Colors.red,
              child: GestureDetector(
                child: Center(
                    child: Text('ADD IMAGR', style: TextStyle(fontSize: 20))),
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
            SizedBox(height: 10),
            ElevatedButton(
                // onPressed: () => _saveData(),
                style: ElevatedButton.styleFrom(
                  primary: endc,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Add Product',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  //   if (_globalKey.currentState!.validate()) {
                  final imgUrl = await uploadImage(_image);
                  Map<String, dynamic> datastore = {
                    'productName': productnameController.text,
                    'Description': descriptionController.text,
                    'productQuantity': quantityController.text,
                    'productPrice': priceController.text,
                    'productType': typeController.text,
                    'productCategory': selectedCate,
                    kProductImage: imgUrl,
                  };
                  try {
                    FirebaseFirestore.instance
                        .collection(kProductCollection)
                        .add(datastore);
                  } catch (e) {
                    print(e);
                  }
                  ;

                  //  }
                }),
        ]),
        ),
      ));

  }

  Widget myTextField({
    required String hintText,
    required String labelText,
    required Function onclick,
    required final TextEditingController controller,
    // final String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      //  validator: validator,
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
