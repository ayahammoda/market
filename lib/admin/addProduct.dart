import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';


class addProduct extends StatefulWidget {
  static String id = 'AddProduct03';
  const addProduct({Key? key}) : super(key: key);

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {

  late String _name, _price, _description;
  List  _category=['l1','l2','l3'];
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
          mainAxisAlignment : MainAxisAlignment.center,
          children:<Widget>[
            myTextField(
              onclick:(value){

                _name=value;
              },
              hintText:"product name...",
              labelText: 'product name',
            ),
            SizedBox(height:10),
            myTextField(
              onclick:(value){

                _price=value;
              },
              hintText:"product price...",
              labelText: 'product price',
            ),
            SizedBox(height:10),
            myTextField(
              onclick:(value){

                _price=value;
              },
              hintText:"product price...",
              labelText: 'product price',
            ),
            myTextField(
              onclick:(value){

                _description=value;
              },
              hintText:"product discription...",
              labelText: 'product discription',
            ),
            SizedBox(height:10),
            myTextField(
              onclick:(value){

                _category=value;
              },
              hintText:"product category...",
              labelText: 'product category',
            ),
            SizedBox(height:10),
            DropdownButton(
              hint: Text("choose a category"),
              dropdownColor:Colors.grey ,
              icon: Icon(Icons.arrow_drop_down),

              value: valuechoose,
                onChanged:(newvalue){
                setState(() {
                  valuechoose == newvalue;
                }
                );

                }, items: _category.map((newitem){
                return DropdownMenuItem(
                value:newitem,
                child:Text(newitem));
                     } ,).toList(),
            ),

            SizedBox(height:20 ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black38),
              onPressed: () {
                if(_globalKey.currentState!.validate()){
                  _globalKey.currentState!.save();
                  _globalKey.currentState!.reset();
                };

              },
              child: Text('ADD PRODUCT'),),
          ],
        ),
      ),

    ) ;
  }
Widget myTextField({required Function onclick ,required String labelText,String ?hintText}){
    return  TextField(
        onTap: onclick(),
        decoration: InputDecoration(
          fillColor: Color(0xFFC894D3),
          filled: true,
          labelText: labelText ,
          labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(
                  color: Colors.black87
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(
                  color: Colors.black87
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(
                  color: Colors.black87
              )
          ),
        )

    );
  }
}

