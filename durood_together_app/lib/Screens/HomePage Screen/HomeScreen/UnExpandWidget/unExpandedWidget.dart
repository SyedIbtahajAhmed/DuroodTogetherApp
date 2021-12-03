import 'dart:math';

import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class UnExpandedWidget extends StatelessWidget {
  final Function unExpandedWidget;
  const UnExpandedWidget({Key key, this.unExpandedWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: GestureDetector(
          onTap: () {
            this.unExpandedWidget();
          },
          child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Button Container
                  IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        Transform.rotate(
                          angle: -90 * (pi / 180),
                          child: Icon(
                            Icons.double_arrow_rounded,
                            color: Constant.app_primary_color.withOpacity(0.8),
                            size: Constant.h1,
                          ),
                        ),
                        Text(
                          'Tasbeeh',
                          style: TextStyle(
                            color: Constant.app_primary_color.withOpacity(0.8),
                            fontSize: Constant.h2,
                            fontWeight: Constant.app_font_weight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
