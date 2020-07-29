import 'package:flutter/material.dart';

class DialogHelper{
  static showAlertDialog({BuildContext context ,Function onOk , Function onCanncel , Widget title , Widget content = null}) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: onOk,
    );
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: onCanncel,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: title,
      content:content,
      actions: [
        okButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}