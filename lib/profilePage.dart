/*import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static String id='profilepage';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 16.0),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('asset/images/photo/ph_main.jpeg'),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: InkWell(
                      onTap: () {
                        // TODO: Implement edit profile picture functionality
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20.0,
                        child: Icon(
                          Icons.camera_alt,
                          size: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                hintText: 'Enter your address',
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save profile functionality
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market1/admin/adminhome.dart';
import 'package:market1/screens/login_screen.dart';

import 'color.dart';


class StoreProfilePage extends StatefulWidget {
  static String id = 'Storeprofilepage';

  @override
  _StoreProfilePageState createState() => _StoreProfilePageState();
}

class _StoreProfilePageState extends State<StoreProfilePage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController nameMController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  final FirebaseStorage _storage =
  FirebaseStorage.instanceFor(bucket: 'gs://firebase_project_id.appspot.com');
  User? _user;
  Map<String, dynamic>? _storeData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
      await _fetchStoreData();
    }
  }

  Future<void> _fetchStoreData() async {
    final snapshot =
        await _firestore.collection('collection_name').doc(_user!.uid).get();
    if (snapshot.exists) {
      setState(() {
        Map<String, dynamic>? data = snapshot.data();
        print('this is snapshot$data');
        print(data?['store_name']);
        nameMController.text = data?['store_name'];
        descriptionController.text = data?['store_description'];
        addressController.text = data?['store_address'];
        _storeData = data;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveData() async {
    if (_formKey.currentState!.saveAndValidate()) {
      setState(() {
        _isLoading = true;
      });
      final imgUrl = await uploadImage(_imageFile!);
      Map<String, dynamic> datastore = {
        'store_name': nameMController.text,
        'store_description': descriptionController.text,
        'store_address': addressController.text,
        'store_image':imgUrl,
      };
      // final data = _formKey.currentState!.value;
      try {
        if (_storeData == null) {
          await _firestore
              .collection('collection_name')
              .doc(_user!.uid)
              .set(datastore);
        } else {
          await _firestore
              .collection('collection_name')
              .doc(_user!.uid)
              .update(datastore);
        }
        if (_imageFile != null) {

          final ref = _storage.ref('stores/${_user!.uid}/profile.jpg');
          await ref.putFile(_imageFile!);
        }
        setState(() {
          _isLoading = false;
          _storeData = null;
          _formKey.currentState!.reset();
        });
        await _fetchStoreData();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ أثناء حفظ البيانات'),
          ),
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('حدث خطأ أثناء حفظ البيانات'),
            ),
          );
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم حفظ البيانات'),
          ),
        );
        print(e);
      }
    }
  }





  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }

  }

  void _logout() async {
    try {
      await _auth.signOut();
      Navigator.pushNamed(context, loginscreen.id);
      //  Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  // File? _imageFile;

  File? _imageFile;
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KB1,
        shadowColor: Colors.black87,
        surfaceTintColor:Colors.green,
        title: Text('My profile'),foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () => _logout(),
            icon: Icon(Icons.logout
              ,color: Colors.black,),

          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
           child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    if (_storeData != null && _storeData!['profile_image'] != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200.100),
                          child: Image.network(
                            _storeData!['profile_image'],
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    TextFormField(
                      controller: nameMController,
                      decoration: InputDecoration(
                        hintText: _storeData?['store_name'],
                        labelText: 'اسم المتجر',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        if (value!.length > 50) {
                          return 'يجب أن يكون الحد الأقصى لطول النص 50 حرفًا';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: _storeData?['store_description'],
                        labelText: 'وصف المتجر',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        if (value!.length > 250) {
                          return 'يجب أن يكون الحد الأقصى لطول النص 250 حرفاً';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: _storeData?['store_address'],
                        labelText: 'عنوان المتجر',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        if (value.length > 100) {
                          return 'يجب أن يكون الحد الأقصى لطول النص 100 حرفاً';
                        }
                        return null;
                      },
                    ),
                    if (_imageFile != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200.200),
                          child: Image.file(
                            _imageFile!,
                            width:  200.200,//double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () => _pickImage(),
                          icon: Icon(Icons.photo),
                          label: Text('تحديد صورة المتجر'),
                        ),
                        ElevatedButton.icon(

                          onPressed: () => _saveData(),
                          icon: Icon(Icons.save),
                          label: Text('حفظ البيانات'),

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
