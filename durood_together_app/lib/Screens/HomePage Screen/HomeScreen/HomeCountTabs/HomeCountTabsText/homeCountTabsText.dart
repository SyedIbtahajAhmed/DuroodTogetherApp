import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class HomeCountTabsText extends StatelessWidget {
  final String text;
  final String count;

  const HomeCountTabsText({Key key, this.text, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.count != null) {
      return Text(
        this.count,
        style: TextStyle(
          color: Constant.app_primary_color,
          fontSize: Constant.h4,
          fontWeight: Constant.app_normal_font_weight,
        ),
      );
    } else if (this.text != null) {
      return Text(
        this.text,
        style: TextStyle(
          color: Constant.app_primary_color,
          fontSize: Constant.h6,
          fontWeight: Constant.app_normal_font_weight,
        ),
      );
    } else {
      print('Both Values Passed!');
    }
  }
}
