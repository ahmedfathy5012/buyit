import 'package:flutter/material.dart';

class OriginTextField extends StatefulWidget {
  Function onChange;
  OriginTextField({this.onChange});
  @override
  _OriginTextFieldState createState() => _OriginTextFieldState();
}

class _OriginTextFieldState extends State<OriginTextField> {
  TextEditingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
          labelText: 'Enter Your Address'
      ),
      onChanged: (text){
        setState(() {
          widget.onChange(text);
        });
      },
    );
  }
}
