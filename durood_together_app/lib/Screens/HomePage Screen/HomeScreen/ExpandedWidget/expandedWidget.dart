import 'dart:math';

import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/ExpandedWidget/CustomTasbeeh/custom-tasbeeh.dart';
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
              padding: EdgeInsets.only(top: screenSize.height * 0.10),
              child: GestureDetector(
                // style: ElevatedButton.styleFrom(
                //   shape: CircleBorder(
                //       side: BorderSide(
                //     color: Constant.app_primary_color,
                //     width: 5.0,
                //   )),
                //   primary: Constant.app_primary_color.withOpacity(0.5),
                // ),
                child: CustomTasbeeh(
                  insideText: context
                      .read<DuroodCountProvider>()
                      .duroodCount
                      .toString(),
                ),

                // child: CustomCircularPercentageIndicator(
                //   radiusData: screenSize.width * 0.9,
                //   percentageData:
                //       context.watch<DuroodCountProvider>().duroodCount /
                //           Functions().percentageDivider(
                //               context.watch<DuroodCountProvider>().duroodCount),
                //   insideText: context
                //       .read<DuroodCountProvider>()
                //       .duroodCount
                //       .toString(),
                //   outsideText: '',
                //   lineWidth: 20.0,
                //   shouldAnimate: false,
                //   progressColor: Constant.app_primary_color,
                //   backgroundColor: Constant.app_primary_contrast_color_light,
                // ),
                onTap: () {
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

// CustomCircularPercentageIndicator(
// radiusData: screenSize.width * 0.9,
// percentageData:
// context.watch<DuroodCountProvider>().duroodCount /
// Functions().percentageDivider(
// context.watch<DuroodCountProvider>().duroodCount),
// insideText: context
//     .read<DuroodCountProvider>()
// .duroodCount
//     .toString(),
// outsideText: '',
// lineWidth: 30.0,
// shouldAnimate: false,
// progressColor: Constant.app_primary_color,
// backgroundColor: Constant.app_primary_contrast_color_light,
// ),

// Container(
// alignment: Alignment.center,
// child: Center(
// child: Text(
// context
//     .watch<DuroodCountProvider>()
// .duroodCount
//     .toString(),
// style: TextStyle(
// fontSize: Constant.h1,
// color: Constant.app_primary_color,
// ),
// ),
// ),
// ),
