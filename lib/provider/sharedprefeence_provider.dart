import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider extends ChangeNotifier{
  bool auth=false;
  SharedPreferences? preferences;
  Future<void> setBool(bool choice)async {
  preferences=await SharedPreferences.getInstance();
  await preferences?.setBool('isLoggedIn', choice);
  auth=preferences?.getBool('isLoggedIn')??false;
  notifyListeners();
  }
  bool? getBool(){
    return preferences?.getBool('isLoggedIn');
  }
}