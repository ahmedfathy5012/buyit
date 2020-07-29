import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:provider/provider.dart';
// Screens
// Widgets
// Providers
import '../../bloc/provider/cart_provider.dart';
// Models
// Helpers
import '../../helpers/constants.dart';
import '../../helpers/screen_helper.dart';
// services


class CartCount extends StatelessWidget {
  final Function onTap;
  final Color iconColor;
  final Color circularColor;
  final int value;
  CartCount({this.iconColor = Colors.black,this.circularColor = MAIN_COLOR, this.onTap,this.value=0});
  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<CartProvider>(context).getitemCount();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenHelper.screenHight(context,30.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.shopping_cart,color: iconColor,),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: circularColor,
                ),
                constraints: BoxConstraints(
                  minWidth: ScreenHelper.screenWidth(context,10),
                  minHeight: ScreenHelper.screenWidth(context,10),
                ),
                child: Text(
                  '$itemCount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
