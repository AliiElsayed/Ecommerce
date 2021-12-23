import 'dart:convert';
import 'package:e_commerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageController extends GetxController {
  setUserData(UserModel userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cachedUserData', jsonEncode(userData.toJson()));
    print('seeetiiiing data ');
    update();
  }

  retrieveDate() async {
    try {
      var cachedData = await _getUserData();
      if (cachedData == null) {
        return null;
      }
      return cachedData;
    } catch (e) {
      print(e.toString());
      return null;
    }

  }

  Future<UserModel> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var retrievedData = await prefs.get('cachedUserData');
    return UserModel.fromJson(jsonDecode(retrievedData));
  }

  deleteCachedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    update();
  }


}
