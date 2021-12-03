import 'dart:math';

import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:vibration/vibration.dart';

class ExpandedWidget extends StatefulWidget {
  final Function expandedWidget;
  const ExpandedWidget({Key key, this.expandedWidget}) : super(key: key);

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // final product = Provider.of<CRUDModel>(context);
    // final duroodCount = Provider.of<DuroodCountVM>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () {
          this.widget.expandedWidget();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Button Container
            IntrinsicHeight(
              child: Transform.rotate(
                angle: 90 * (pi / 180),
                child: Icon(
                  Icons.double_arrow_rounded,
                  color: Constant.app_primary_color,
                  size: Constant.h1,
                ),
              ),
            ),

            // Rounded Button
            Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(
                      side: BorderSide(
                    color: Constant.app_primary_color,
                    width: 5.0,
                  )),
                  primary: Constant.app_primary_color.withOpacity(0.4),
                ),
                child: Container(
                  width: screenSize.width < 350 ? 250 : 300,
                  height: screenSize.width < 350 ? 250 : 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      context
                          .watch<DuroodCountProvider>()
                          .duroodCount
                          .toString(),
                      style: TextStyle(
                        fontSize: Constant.h1,
                        color: Constant.app_primary_color,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Vibration.vibrate(
                      duration: Functions().setVibration(
                          context.read<DuroodCountProvider>().duroodCount));
                  context.read<DuroodCountProvider>().addDuroodCount();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
