import 'package:flutter/cupertino.dart';

class ModelHude extends ChangeNotifier
{
  bool isloading= false ;

  changeisloadiing(bool value)
  {
    isloading = value;
    notifyListeners();
  }
}