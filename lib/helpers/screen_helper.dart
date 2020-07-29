import 'package:flutter/material.dart';

class ScreenHelper{

  static double screenHight(BuildContext context,double factor){
    return (factor/640)*MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context,double factor){
    return (factor/360)*MediaQuery.of(context).size.width;
  }

  static double screenFont(BuildContext context,double factor){
    return (factor/400)*MediaQuery.of(context).size.width;
  }


}