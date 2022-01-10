import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/service/local_storage_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  LocalStorageController localStorageController = LocalStorageController();
  UserModel userData;
  ValueNotifier<bool> loading = ValueNotifier(false);
  @override
  void onInit() {
    getLocallyStoredData();
    super.onInit();
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookLogin().logOut();
    localStorageController.deleteUserCachedData();
    update();
  }

  getLocallyStoredData() async {
    loading.value = true;
    userData = await localStorageController.retrieveDate();
    loading.value = false;
    update();
  }



}
