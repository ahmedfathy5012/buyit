import 'package:cloud_firestore/cloud_firestore.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
import '../bloc/model/product.dart';
// Helpers
import '../helpers/constants.dart';

//sevices
class ProductOperations{
final Firestore _firestore = Firestore.instance;
addProduct(Product product){
  _firestore.collection(PRODUCTS_COLLECTION).add(product.toMap());
 }


 Stream<QuerySnapshot> loadProducts() {
  return _firestore.collection(PRODUCTS_COLLECTION).snapshots();
 }

 List<Product> prepareProducts({var snapshot , String category = ''}){
   List<Product> loadProducts= [];
   if(category.isNotEmpty){
     for (var document in snapshot.documents) {
       if(document.data['productCategory'] == category){
         loadProducts.add(Product.fromJson(jsonObject: document.data , documentID: document.documentID));
       }
     }
   }else{
     for (var document in snapshot.documents) {
       loadProducts.add(Product.fromJson(jsonObject: document.data , documentID: document.documentID));

     }
   }
   return loadProducts;
 }

 Future<void> deletProduct(String documentId){
   _firestore.collection(PRODUCTS_COLLECTION).document(documentId).delete();
 }

editProduct(Product product) {
  _firestore
      .collection(PRODUCTS_COLLECTION)
      .document(product.id)
      .updateData(product.toMap());
}
}