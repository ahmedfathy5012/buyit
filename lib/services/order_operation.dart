import 'package:cloud_firestore/cloud_firestore.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
import '../bloc/model/order.dart';
// Helpers
import '../helpers/constants.dart';
//sevices


class OrderOperation{
  final Firestore _firestore = Firestore.instance;



  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection(ORDER_COLLECTION).snapshots();
  }

  List<Order> prepareOrders({var snapshot}){
    List<Order> loadOrders= [];
      for (var document in snapshot.documents) {
        loadOrders.add(Order.fromJson(document));
      }
    return loadOrders;
  }


  chargedOrder(Order order){
    order.status = 'charged';
    order.chargedAt = DateTime.now().toString();
    _firestore.collection(ORDER_COLLECTION).document(order.id).updateData(order.toMap());
  }

  arrivedOrder(Order order){
    order.status = ' ';
    order.arrivedAt = DateTime.now().toString();
    _firestore.collection(ORDER_COLLECTION).document(order.id).updateData(order.toMap());
  }


}