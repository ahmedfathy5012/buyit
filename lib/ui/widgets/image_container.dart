import 'package:flutter/material.dart';

import '../../helpers/screen_helper.dart';
import '../../helpers/constants.dart';
import '../../utils/image_selector.dart';
import 'dart:io';



class ImageContainer extends StatelessWidget {
  final double raduis;
  final Color raduisColor;
  final Color fillColor;
  File image = null;

  ImageContainer({ this.raduis = 15.0, this.raduisColor = Colors.white, this.fillColor = SECONDARY_COLOR, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenHelper.screenHight(context, 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context, raduis)),
          border: Border.all(color: raduisColor ),
          color: fillColor,
          image: image == null ? null : DecorationImage(image:AssetImage(image.path),fit: BoxFit.cover),
        ),
        child: image == null ?
        Center(child: Text('Tap To Insert An Image',style: TextStyle(color: Color(0xff7E7155)),),)
            :
        SizedBox(height: 0.0,),
      );
  }
}
