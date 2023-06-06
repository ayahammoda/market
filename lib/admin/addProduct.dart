
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  String _name = 'j', _type = '..', _description = 'ew,kmnbvc';
  int _price = 0, _quantity = 0;
  List _category = ['l1', 'l2', 'l3'];
  // String valuechoose = 'null';
  String? selectedCate;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: KText),
      backgroundColor: backgroundColor,
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              myTextField(
                onclick: () {
                  (value) => _name = value;
                },
                hintText: "product name...",
                labelText: 'product name',
              ),
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
                  (value) => _price = value;
                },
                hintText: "product price...",
                labelText: 'product price',
              ),
              SizedBox(height: 10),
              myTextField(
                onclick: () {
                  (value) => _quantity = value;
                },
                hintText: "product quantity...",
                labelText: 'product quantity',
              ),
              SizedBox(height: 10),
              myTextField(
                onclick: () {
                  (value) => _description = value;
                },
                hintText: "product discription...",
                labelText: 'product discription',
              ),
              SizedBox(height: 10),
              myTextField(
                onclick: () {
                  (value) => _category = value;
                },
                hintText: "product category...",
                labelText: 'product category',
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
                    value: selectedCate, // Set the default value to null.
                    hint: Text("Select an item"),
                  );
                },
              ),
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
        fillColor: const Color(0xFFC894D3),
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
