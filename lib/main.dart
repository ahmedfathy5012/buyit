import 'package:buyit/bloc/provider/cart_provider.dart';
import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:provider/provider.dart';
// Screens
import './ui/screens/login_screen.dart';
import './ui/screens/signup_screen.dart';
import 'package:buyit/ui/screens/user/home_screen.dart';
import 'package:buyit/ui/screens/admin/admin_screen.dart';
import 'package:buyit/ui/screens/admin/add_product_screen.dart';
import 'package:buyit/ui/screens/admin/admin_view_products.dart';
import 'package:buyit/ui/screens/user/product_screen.dart';
import 'package:buyit/ui/screens/user/cart_screen.dart';
import './ui/screens/admin/test.dart';
import './ui/screens/admin/orders_screen.dart';
import './ui/screens/admin/order_screen.dart';
import './ui/screens/test.dart';
// Widgets
// Providers
import './bloc/provider/modal_hud.dart';
import './bloc/provider/admin_mode.dart';
import './bloc/provider/cart_provider.dart';
// Models
// Helpers


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ModalHud()),
        ChangeNotifierProvider.value(value: AdminMode()),
        ChangeNotifierProvider.value(value: CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: LoginScreen.routeName ,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          AdminScreen.routeName: (context) => AdminScreen(),
          AddProductScreen.routeName: (context) => AddProductScreen(),
          AdminViewProducts.routeName: (context) => AdminViewProducts(),
          ProductScreen.routeName: (context)=> ProductScreen(),
          CartScreen.routeName: (context)=> CartScreen(),
          OrdersScreen.routeName: (context)=> OrdersScreen(),
          OrderScreen.routeName: (context)=> OrderScreen(),
          Notifications.routeName: (context)=> Notifications(),
        },
      ),
    );
  }
}

