import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  String text;
  CustomSnackbar({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
