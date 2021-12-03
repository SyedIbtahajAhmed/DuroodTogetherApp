import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomCircularPercentageIndicator extends StatelessWidget {
  final double radiusData;
  final double percentageData;
  final String insideText;
  final String outsideText;
  const CustomCircularPercentageIndicator({
    Key key,
    this.radiusData,
    this.percentageData,
    this.insideText,
    this.outsideText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: CircularPercentIndicator(
        radius: this.radiusData != null ? this.radiusData : 100.0,
        lineWidth: 15.0,
        percent: this.percentageData != null ? this.percentageData : 0.0,
        animation: true,
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
        footer: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: new Text(
            this.outsideText != null ? this.outsideText : 'Text Not Given',
            style: TextStyle(
              color: Constant.app_primary_color,
              fontSize: Constant.h4,
              fontWeight: Constant.app_font_weight,
            ),
          ),
        ),
        progressColor: Constant.app_primary_contrast_color_light,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
