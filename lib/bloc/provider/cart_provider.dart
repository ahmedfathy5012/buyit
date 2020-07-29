import 'package:flutter/cupertino.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
import '../model/product.dart';
// Helpers
//sevices


class CartProvider extends ChangeNotifier{
List<Product> products = [];
int orderCount=1;

addToCart(Product product){
    for(int i =0 ; i < products.length ; i++){
       if(products[i].id==product.id){
         products[i].quantity++;
         notifyListeners();
         return;
       }
    }
    products.add(product);
    notifyListeners();
}


int getitemCount(){
  return products.length;
}

increaseOrderCount(){
  orderCount++;
  notifyListeners();
}

decreaseOrderCount(){
  if(orderCount>1)
    orderCount--;
  notifyListeners();
}

resetOrderCount(){
    orderCount=1;
  notifyListeners();
}

resetProducts(){
  products.clear();
  notifyListeners();
}



}