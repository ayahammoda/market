import 'package:flutter/material.dart';

import '../Widget/textfield2.dart';

class AddProduct extends StatefulWidget {
  static String id = 'AddProduct03';
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late String _name, _price, _description;
  List _category = ['l1', 'l2', 'l3'];
  late String valuechoose;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black38),
      backgroundColor: Color(0xFFB970CE),
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            myTextField(
              onclick: (value) {
                _name = value;
              },
              hintText: "product name...",
              labelText: 'product name',
            ),
            SizedBox(height: 10),
            myTextField(
              onclick: (value) {
                _price = value;
              },
              hintText: "product price...",
              labelText: 'product price',
            ),
            SizedBox(height: 10),
            myTextField(
              onclick: (value) {
                _price = value;
              },
              hintText: "product price...",
              labelText: 'product price',
            ),
            myTextField(
              onclick: (value) {
                _description = value;
              },
              hintText: "product discription...",
              labelText: 'product discription',
            ),
            SizedBox(height: 10),
            myTextField(
              onclick: (value) {
                _category = value;
              },
              hintText: "product category...",
              labelText: 'product category',
            ),
            SizedBox(height: 10),
            DropdownButton(
              hint: Text("choose a category"),
              dropdownColor: Colors.grey,
              icon: Icon(Icons.arrow_drop_down),
              value: valuechoose,
              onChanged: (newvalue) {
                setState(() {
                  valuechoose == newvalue;
                });
              },
              items: _category.map(
                (newitem) {
                  return DropdownMenuItem(value: newitem, child: Text(newitem));
                },
              ).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black38),
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();
                  _globalKey.currentState!.reset();
                }
                ;
              },
              child: Text('ADD PRODUCT'),
            ),
          ],
        ),
      ),
    );
  }
}
