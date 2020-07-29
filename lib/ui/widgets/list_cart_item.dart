import 'package:flutter/material.dart';
import '../../helpers/constants.dart';
class ListCartItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Widget trailing;
  final Function onTap;
  final Function onLongPress;

  ListCartItem({ this.title, this.subtitle, this.onTap, this.image, this.onLongPress, this.trailing});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      onLongPress: onLongPress,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading: CircleAvatar(
                radius: 29.0,
                backgroundImage: AssetImage('assets/images/jacket.jpg'),
              ),
              trailing: trailing,
              title: Text(title,style: TextStyle(fontSize: 22.0,color: MAIN_COLOR,fontWeight: FontWeight.w600),),
              subtitle: Text(subtitle,style: TextStyle(fontSize: 15.0,color: GRAY_COLOR,fontWeight: FontWeight.w500),),
            ),

          ],
        ),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
    );
  }
}