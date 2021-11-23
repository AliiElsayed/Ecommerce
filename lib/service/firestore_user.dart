import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _usersCollectionRef =
      FirebaseFirestore.instance.collection('users');

   Future<void> addUserToUsersCollection(UserModel userModel) async{
    await _usersCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUserDataFromCollection(String userId) async{
    return await _usersCollectionRef.doc(userId).get();
  }
}
