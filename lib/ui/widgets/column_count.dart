import 'package:flutter/material.dart';

// helpers
import '../../helpers/constants.dart';
import '../../helpers/screen_helper.dart';
import '../../helpers/dialog_helper.dart';

class ColumnCount extends StatelessWidget {
  final String number;
  final String title;
  double numberSize;
  double titleSize;


  ColumnCount({this.number, this.title,this.numberSize=50.0,this.titleSize=10.0});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          number.toString(),
          style: TextStyle(
              fontSize: ScreenHelper.screenFont(context, numberSize),
              fontWeight: FontWeight.bold,
              color: MAIN_COLOR),
        ),
        Text(
          title.toString(),
          style: TextStyle(
              fontSize: ScreenHelper.screenFont(context, titleSize),
              fontWeight: FontWeight.bold,
              color: GRAY_COLOR),
        ),
      ],
    );
  }
}
