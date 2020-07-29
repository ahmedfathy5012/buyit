import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:cloud_firestore/cloud_firestore.dart';
// Screens
// Widgets
import '../widgets/grid_item.dart';
// Providers
// Models
import '../../bloc/model/product.dart';
// Helpers
import '../../helpers/screen_helper.dart';
//sevices
import '../../services/product_operations.dart';


class StreamData extends StatelessWidget {
  final bool isAdmin;
  final String category;
  StreamData({this.isAdmin=false,this.category=''});
  final ProductOperations _productOperations = ProductOperations();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _productOperations.loadProducts(),
        builder: (context,snapshot){
          List<Product> _products = [];
          if(snapshot.hasData){
            _products = _productOperations.prepareProducts(snapshot: snapshot.data , category: category);
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing:ScreenHelper.screenWidth(context, 5.0),
                mainAxisSpacing: ScreenHelper.screenHight(context, 5.0),
              ),
              itemCount: _products.length,
              itemBuilder: (context,index)=>GridItem(products: _products,index: index,isAdmin: isAdmin,),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}
