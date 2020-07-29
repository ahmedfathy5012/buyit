import 'package:flutter/material.dart';

// widgets
import 'outer_button.dart';

// helpers
import '../../helpers/constants.dart';
import '../../helpers/screen_helper.dart';



class StatusColumn extends StatelessWidget {
  final String status;
  final String date;

  const StatusColumn({this.status, this.date});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       OuterButton(title: 'Pending',),
        SizedBox(height: ScreenHelper.screenHight(context,5.0),),
        Text(date.trim().toString(),style: TextStyle(
          color: GRAY_COLOR,
          fontSize: ScreenHelper.screenFont(context,12.0),
        ),)
      ],
    );
  }
}
