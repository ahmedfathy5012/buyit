 import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
import 'package:buyit/ui/screens/admin/add_product_screen.dart';
import 'admin_view_products.dart';
import 'orders_screen.dart';
// Widgets
// Providers
// Models
// Helpers
import '../../../helpers/constants.dart';
//sevices


class AdminScreen extends StatelessWidget {
  static String routeName = 'AdminScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: MAIN_COLOR,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Add Product'),
                onPressed: (){
                  Navigator.pushNamed(context,AddProductScreen.routeName,arguments: null);
                }
             ),
            RaisedButton(
                child: Text('View Products'),
                onPressed: (){
                  Navigator.pushNamed(context,AdminViewProducts.routeName);
                }
            ),
            RaisedButton(
                child: Text('View Orders'),
                onPressed: (){
                  Navigator.pushNamed(context,OrdersScreen.routeName);
                }
            ),
          ],
        ),
      ),
    );
  }
}
