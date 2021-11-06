import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';

class HomeCountTabsText extends StatelessWidget {
  final String text;
  final int count;

  const HomeCountTabsText({Key key, this.text, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.count != null) {
      return Text(
        Numeral(this.count).value().toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      );
    } else if (this.text != null) {
      return Text(
        this.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
        ),
      );
    } else {
      print('Both Values Passed!');
    }
  }
}
