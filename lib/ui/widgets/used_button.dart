import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../helpers/screen_helper.dart';
import '../../helpers/constants.dart';

class UsedButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final double raduis;
  final double buttonHeight;
  final VoidCallback onPressed;
  final double sideWidth;
  final Color sideColor;


  UsedButton({this.title, this.buttonColor = Colors.black, this.textColor = Colors.white, this.raduis = 15.0, this.onPressed, this.buttonHeight = 35, this.sideWidth = 1.0, this.sideColor= Colors.transparent}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHight(context,buttonHeight),
      child: FlatButton(
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(ScreenHelper.screenHight(context,raduis)),
          side: BorderSide(
            style: BorderStyle.solid,
            width: ScreenHelper.screenWidth(context, sideWidth),
            color: sideColor,
          ),

        ),
          onPressed:onPressed,
          child: Text(
            title,
            style: TextStyle(color:textColor),
          ),
          color: buttonColor,
      ),
    );
  }
}
