import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PositionsWidget extends StatelessWidget {
  final double radiusData;
  final double percentageData;
  final String insideText;
  final String outsideText;
  final double lineWidth;
  final bool shouldAnimate;
  final Color progressColor;
  final Color backgroundColor;
  const PositionsWidget({
    Key key,
    this.radiusData,
    this.percentageData,
    this.insideText,
    this.outsideText,
    this.lineWidth,
    this.shouldAnimate,
    this.progressColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: CircularPercentIndicator(
        radius: this.radiusData != null ? this.radiusData : 100.0,
        lineWidth: this.lineWidth,
        percent: this.percentageData != null ? this.percentageData : 0.0,
        animation: this.shouldAnimate,
        animationDuration: 2000,
        center: new Text(
          this.insideText != null ? this.insideText : '0%',
          style: TextStyle(
            color: Constant.app_primary_color,
            fontSize: Constant.h5,
            fontWeight: Constant.app_font_weight,
            letterSpacing: Constant.app_normal_letter_spacing,
          ),
        ),
        // footer: Padding(
        //   padding: const EdgeInsets.only(top: 10.0),
        //   child: new Text(
        //     this.outsideText != null ? this.outsideText : '',
        //     style: TextStyle(
        //       color: Constant.app_primary_color,
        //       fontSize: Constant.h4,
        //       fontWeight: Constant.app_font_weight,
        //     ),
        //   ),
        // ),
        progressColor: this.progressColor,
        backgroundColor: this.backgroundColor.withAlpha(200),
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
