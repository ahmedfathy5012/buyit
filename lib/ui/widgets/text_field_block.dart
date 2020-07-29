import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../helpers/constants.dart';
import '../../helpers/screen_helper.dart';

class TextFieldBlock extends StatelessWidget {
  final String hint;
  final IconData icon;
  final double raduis;
  final Color raduisColor;
  final Color fillColor;
  final bool isSecure;
  final String errorMessage;
  final Function onSaved;
  final String initValue;

  const TextFieldBlock({@required this.hint,@required this.icon, this.raduis = 15.0, this.raduisColor = Colors.white, this.fillColor = SECONDARY_COLOR, this.onSaved, this.isSecure=false, this.errorMessage=null,this.initValue});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      obscureText: isSecure,
      validator: (value){
      if(value.isEmpty)
        return errorMessage;
      return null;
      },
      onSaved: onSaved,
      cursorColor: MAIN_COLOR,
      decoration: InputDecoration(
        prefixIcon: Icon(icon,color: MAIN_COLOR,),
        hintText: hint,
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context,raduis)),
          borderSide: BorderSide(
            color: raduisColor
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context,raduis)),
          borderSide: BorderSide(
              color: raduisColor
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context,raduis)),
          borderSide: BorderSide(
              color: Colors.red
          ),
        ),
      ),
    );
  }
}
