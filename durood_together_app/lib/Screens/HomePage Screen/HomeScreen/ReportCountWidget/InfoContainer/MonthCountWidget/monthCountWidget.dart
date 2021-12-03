import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class MonthCountWidget extends StatelessWidget {
  final String text;
  final String totalCount;
  const MonthCountWidget({Key key, this.text, this.totalCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      // width: (screenSize.width / 2) * 1.5,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Text
          Text(
            this.text,
            style: TextStyle(
              color: Constant.app_primary_color,
              fontSize: Constant.h5,
              fontWeight: Constant.app_normal_font_weight,
            ),
          ),
          // Count
          totalCount != null
              ? Text(
                  this.totalCount,
                  style: TextStyle(
                    color: Constant.app_primary_color,
                    fontSize: Constant.h5,
                    fontWeight: Constant.app_normal_font_weight,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
