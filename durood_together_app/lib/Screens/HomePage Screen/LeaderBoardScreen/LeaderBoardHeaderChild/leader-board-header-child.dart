import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class LeaderBoardHeaderChild extends StatefulWidget {
  const LeaderBoardHeaderChild({Key key}) : super(key: key);

  @override
  _LeaderBoardHeaderState createState() => _LeaderBoardHeaderState();
}

class _LeaderBoardHeaderState extends State<LeaderBoardHeaderChild> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
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
    );
  }
}
