import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
import '../../widgets/stream_order_data.dart';
// Providers
// Models
// Helpers
import '../../../helpers/constants.dart';
import '../../../helpers/screen_helper.dart';
//sevices

class OrdersScreen extends StatelessWidget {
  static String routeName = 'OrdersScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: MAIN_COLOR,
      ),
      body: Padding(
        padding:  EdgeInsets.all(ScreenHelper.screenHight(context,15.0)),
        child: StreamOrderData(),
      ),
    );
  }
}
