import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class DateTextContainer extends StatelessWidget {
  final String date;
  final String text;
  const DateTextContainer({Key key, this.date, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: <Widget>[
          // Date Container
          date != null
              ? Container(
                  child: Text(
                    this.date,
                    style: TextStyle(
                      color: Constant.app_primary_color,
                      fontSize: Constant.h6,
                      fontWeight: Constant.app_font_weight,
                    ),
                  ),
                )
              : Container(),

          // Text Container
          text != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    child: Text(
                      this.text,
                      style: TextStyle(
                        color: Constant.app_primary_color,
                        fontSize: Constant.h5,
                        fontWeight: Constant.app_normal_font_weight,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
