import 'package:durood_together_app/Shared/Const/constant.dart';
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
              fontSize: Constant.h7,
              fontWeight: Constant.app_font_weight,
              letterSpacing: Constant.app_normal_letter_spacing,
              color: Constant.app_primary_color,
            ),
          ),
        ],
      ),
    );
  }
}
