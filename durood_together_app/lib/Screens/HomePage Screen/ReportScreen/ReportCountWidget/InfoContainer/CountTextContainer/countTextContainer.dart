import 'package:flutter/material.dart';

class CountTextConainer extends StatelessWidget {
  final String text;
  const CountTextConainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
