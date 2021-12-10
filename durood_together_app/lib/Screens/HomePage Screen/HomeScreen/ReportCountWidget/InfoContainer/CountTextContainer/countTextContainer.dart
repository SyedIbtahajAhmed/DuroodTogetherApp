import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class CountTextContainer extends StatelessWidget {
  final String text;
  const CountTextContainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: Constant.app_primary_color,
        fontSize: Constant.h3,
        fontWeight: Constant.app_normal_font_weight,
      ),
    );
  }
}
