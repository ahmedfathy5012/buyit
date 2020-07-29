import 'package:flutter/material.dart';

// helper
import '../../helpers/constants.dart';
import '../../helpers/screen_helper.dart';

class OuterButton extends StatelessWidget {
  final String title;
  Function ontap = (){};

  OuterButton({this.title,this.ontap});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: ontap,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(ScreenHelper.screenWidth(context, 5.0)),
        side: BorderSide(
          color: MAIN_COLOR,
          width: 2.0,
          style: BorderStyle.solid
        ),
      ),
        child: Center(
            child: Text(
              '${title.trim().toString()}',
              style: TextStyle(color: GRAY_COLOR, fontWeight: FontWeight.w700,fontSize: ScreenHelper.screenFont(context, 15.0)),
            )));
  }
}
