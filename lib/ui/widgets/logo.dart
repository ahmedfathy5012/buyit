import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../helpers/screen_helper.dart';


class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: ScreenHelper.screenHight(context,100.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image(image: AssetImage('assets/icons/logo_icon.png')),
          Positioned(
              bottom: 0.0,
              child: Text('Buy It',style: TextStyle(fontFamily: 'pacifico',fontSize: ScreenHelper.screenFont(context,25)),))
        ],
      ),
    );
  }
}
