import 'package:flutter/material.dart';
import '../../widgets/cart_count.dart';
class Test extends StatelessWidget {
  static String routeName = 'TestScreen';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: CartCount(onTap: (){},),
      ),
    );
  }
}
