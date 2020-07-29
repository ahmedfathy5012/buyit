import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
import 'package:provider/provider.dart';
// Screens
// Widgets
// Providers
import '../../bloc/provider/cart_provider.dart';
// Models
import '../../bloc/model/product.dart';
// Helpers
import '../../helpers/constants.dart';
import '../../helpers/screen_helper.dart';
//sevices
class LargeButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final Function onTap;

  const LargeButton({Key key, this.title, this.buttonColor=MAIN_COLOR, this.textColor=Colors.black, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: ScreenHelper.screenHight(context,50.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(ScreenHelper.screenWidth(context,10.0),),
              topLeft: Radius.circular(ScreenHelper.screenWidth(context,10.0),)
          ),
        ),
        color: buttonColor,
        onPressed: onTap,
        child: Text(title,style: TextStyle(color: textColor,fontSize: ScreenHelper.screenFont(context, 18.0),fontWeight: FontWeight.bold),),
      ),
    );
  }
}
