import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {


  //for 1st dialog
  int _groupValue = 0;
  int get groupValue => _groupValue;

  set groupValue(int value) {
    _groupValue = value;
    notifyListeners();
  }


  bool _isClick = false;
  bool get isClick => _isClick;

  double _updateDialogHeight = 60.0;
  double get updateDialogHeight => _updateDialogHeight;

  set expandDialog(bool value){
     _isClick = value;
     _updateDialogHeight = _isClick ? 270.0 : 60.0;
    notifyListeners();
  }

  String _name = 'Select';
  String get name => _name;

  set updateName(value){
    _name=value;
    notifyListeners();
  }


  //for 2nd dialog
  String? _selectedCountry;

  String? get selectedCountry=>_selectedCountry;

  set selectedCountry(String? country){
    _selectedCountry=country;
    notifyListeners();
  }


}