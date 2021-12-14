import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class LeaderBoardHeader extends StatefulWidget {
  const LeaderBoardHeader({Key key}) : super(key: key);

  @override
  _LeaderBoardHeaderState createState() => _LeaderBoardHeaderState();
}

class _LeaderBoardHeaderState extends State<LeaderBoardHeader> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 1500),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOutCubicEmphasized,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Durood Together',
            style: TextStyle(
              fontWeight: Constant.app_font_weight,
              fontSize: Constant.h1,
              color: Constant.app_primary_contrast_color,
              letterSpacing: Constant.app_normal_letter_spacing,
            ),
          ),
          Text(
            'Leader Boards',
            style: TextStyle(
              fontWeight: Constant.app_font_weight,
              fontSize: Constant.h2,
              color: Constant.app_primary_contrast_color.withOpacity(0.9),
              letterSpacing: Constant.app_normal_letter_spacing,
            ),
          ),
        ],
      ),
      builder: (context, headerValue, Widget child) {
        return Container(
          width: double.infinity,
          height: screenSize.height * 0.31 * headerValue,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(Constant.app_headers_border_radius),
              bottomLeft: Radius.circular(Constant.app_headers_border_radius),
            ),
            boxShadow: [
              BoxShadow(
                color: Constant.app_primary_contrast_color.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(3, 5), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.3,
                1.0,
              ],
              colors: [
                Constant.app_primary_color.withAlpha(200),
                Constant.app_primary_contrast_color,
              ],
            ),
          ),
          child: Transform.translate(
            offset: Offset(0.0, 10 * headerValue),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              opacity: 1.0 * headerValue,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
