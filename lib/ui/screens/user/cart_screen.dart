import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:provider/provider.dart';
// Screens
// Widgets
import '../../widgets/list_cart_item.dart';
import '../../widgets/large_button.dart';
import '../../widgets/origin_text_field.dart';
// Providers
import '../../../bloc/provider/cart_provider.dart';
// Models
import '../../../bloc/model/product.dart';
import '../../../bloc/model/order.dart';
// Helpers
import '../../../helpers/screen_helper.dart';
//sevices
import '../../../services/cart_operations.dart';




class CartScreen extends StatelessWidget {
  static String routeName = 'CartScreen';
  CartOperations _cartOperations = CartOperations();
  @override
  Widget build(BuildContext context) {
    List<Product> _products = Provider.of<CartProvider>(context).products;
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       title: Text('My Cart',style: TextStyle(color: Colors.black),),
       leading: GestureDetector(
         onTap: (){
           Navigator.pop(context);
         },
         child: Icon(Icons.arrow_back_ios,color: Colors.black,),
       ),
     ),
     body:Stack(
       children: <Widget>[
         ListView.builder(
             itemCount: _products.length,
             itemBuilder: (context,index)=> Padding(
               padding:  EdgeInsets.symmetric(horizontal:ScreenHelper.screenWidth(context,10.0),vertical: ScreenHelper.screenHight(context,3.0)),
               child: ListCartItem(
                 title: _products[index].name.toString(),
                 subtitle: _products[index].description.toString(),
                 onLongPress: (){
                   print('ahmed');
                 },
               ),
             ),
         ),
         Positioned(
           bottom: 0.0,
           child: Builder(
             builder: (context)=> LargeButton(title: 'Order',onTap:(){
              _cartOperations.submitOrder(context,_products);
             }),
           ),
         ),
       ],
     )
    );
  }




}