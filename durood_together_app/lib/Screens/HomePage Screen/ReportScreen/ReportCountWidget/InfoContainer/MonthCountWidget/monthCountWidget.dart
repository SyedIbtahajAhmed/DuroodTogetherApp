import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/ReportCountWidget/InfoContainer/DateTextContainer/dateTextContainer.dart';
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
      width: (screenSize.width / 2) * 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Text
          DateTextContainer(
            text: this.text,
          ),
          // Count
          totalCount != null
              ? DateTextContainer(
                  date: this.totalCount,
                )
              : Container(),
        ],
      ),
    );
  }
}
