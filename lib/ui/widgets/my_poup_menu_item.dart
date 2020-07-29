import 'package:flutter/material.dart';

class MyPopupMenuItem<T> extends PopupMenuItem<T>{
  final Widget child;
  final Function onTap;
  MyPopupMenuItem({this.child,this.onTap}):super(child:child);
  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemStyle();
  }
}

class MyPopupMenuItemStyle<T,PopupMenuItem> extends PopupMenuItemState<T,MyPopupMenuItem<T>>{
  @override
  void handleTap() {
    widget.onTap();
  }
}


