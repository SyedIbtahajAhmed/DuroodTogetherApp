import 'package:flutter/material.dart';
import 'dart:math';

class UnExpandedWidget extends StatelessWidget {
  final Function unExpandedWidget;
  const UnExpandedWidget({Key key, this.unExpandedWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                            color: Colors.white.withOpacity(0.8),
                            size: 50.0,
                          ),
                        ),
                        Text(
                          'Tasbeeh',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 35.0,
                            fontWeight: FontWeight.w500,
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
