import 'package:flutter/material.dart';

class CountTextContainer extends StatelessWidget {
  final String text;
  const CountTextContainer({Key key, this.text}) : super(key: key);

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
