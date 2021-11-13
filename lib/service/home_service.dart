
import 'package:cloud_firestore/cloud_firestore.dart';

 /// i don't use this service layer .................
class HomeService{
  final CollectionReference _usersCollectionRef =
  FirebaseFirestore.instance.collection('categories');
  final CollectionReference _productsCollectionRef =
  FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getAllCategories() async{
     var categories= await _usersCollectionRef.get();
     return categories.docs;
  }


  Future<List<QueryDocumentSnapshot>> getAllProducts() async{
    var products= await _productsCollectionRef.get();
    return products.docs;
  }


}