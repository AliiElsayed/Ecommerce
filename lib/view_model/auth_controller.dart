import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/service/firestore_user.dart';
import 'package:e_commerce/service/local_storage_controller.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  LocalStorageController localStorageController = LocalStorageController();

  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;

  String email, password, name, confirmedPassword;
  bool hidePassword = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSinInMethod() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuthentication =
        await googleUser.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuthentication.idToken,
      accessToken: googleAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((userInfo) async {
      await saveUser(userInfo);
    });

    update();
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      OAuthCredential faceCredential =
          FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(faceCredential).then((userInfo) async {
        await saveUser(userInfo);
      });
    }
    update();
  }

  void signInWithEmailPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((userInfo) async {
        await FireStoreUser()
            .getCurrentUserDataFromCollection(userInfo.user.uid)
            .then((value) {
          storeUserDataLocally(UserModel.fromJson(value.data()));
        });
      });
    } catch (e) {
      Get.snackbar(
        'Login Error',
        '${e.message}',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }



  void signUpWithEmailPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userInfo) async {
        await saveUser(userInfo);
      });
    } catch (e) {
      Get.snackbar(
        'Login Error',
        '${e.message}',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    update();
  }

  Future saveUser(UserCredential userInfo) async {
    UserModel userModel = UserModel(
      userId: userInfo.user.uid,
      name: name == null ? userInfo.user.displayName : name,
      email: userInfo.user.email,
      pic: userInfo.user.photoURL,
    );
    await FireStoreUser().addUserToUsersCollection(userModel);
    Get.offAll(ControlView());
    storeUserDataLocally(userModel);
    update();
  }

  storeUserDataLocally(UserModel userData) async {
    await localStorageController.setUserData(userData);
    update();
  }
}
