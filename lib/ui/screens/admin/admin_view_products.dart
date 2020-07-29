import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
import 'package:buyit/ui/screens/admin/add_product_screen.dart';
// Widgets
import '../../widgets/stream_data.dart';
// Providers
// Models
// Helpers
import '../../../helpers/constants.dart';
//sevices


class AdminViewProducts extends StatelessWidget {
  static String routeName = 'EditProductScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamData(isAdmin: true,),
      floatingActionButton: FloatingActionButton(
          backgroundColor: MAIN_COLOR,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.pushNamed(context,AddProductScreen.routeName,arguments: null);
          }
          ),
    );
  }
}


