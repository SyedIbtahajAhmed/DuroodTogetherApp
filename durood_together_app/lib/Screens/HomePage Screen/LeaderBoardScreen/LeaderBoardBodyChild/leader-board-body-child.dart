import 'package:durood_together_app/Shared/Components/PositionsWidget/positions-widget.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LeaderBoardRowEntry/leader-board-row-entry.dart';

class LeaderBoardBodyChild extends StatefulWidget {
  const LeaderBoardBodyChild({Key key}) : super(key: key);

  @override
  _LeaderBoardBodyChildState createState() => _LeaderBoardBodyChildState();
}

class _LeaderBoardBodyChildState extends State<LeaderBoardBodyChild> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width < 350 ? 330 : 380,
      child: Column(
        children: [
          // Positins Stack
          Container(
            color: Constant.app_primary_contrast_color,
            width: screenSize.width < 350 ? 330 : 380,
            height: 230.0,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                // Top 3 Positions Container
                Positioned(
                  right: 240,
                  top: 90.0,
                  child: Container(
                    child: PositionsWidget(
                      backgroundColor: Constant.app_primary_color,
                      shouldAnimate: true,
                      progressColor: Constant.app_primary_contrast_color_light,
                      lineWidth: 10.0,
                      // outsideText: 'Hamza Siddiqui',
                      insideText: '2nd',
                      radiusData: 130.0,
                      percentageData: 0.7,
                    ),
                  ),
                ),
                // Top 1st Position
                Positioned(
                  // left: 115,
                  child: Container(
                    child: PositionsWidget(
                      backgroundColor: Constant.app_primary_color,
                      shouldAnimate: true,
                      progressColor: Constant.app_primary_contrast_color_light,
                      lineWidth: 15.0,
                      // outsideText: 'Syed Ibtahaj Ahmed',
                      insideText: '1st',
                      radiusData: 200.0,
                      percentageData: 0.9,
                    ),
                  ),
                ),
                // Top 3rd Position
                Positioned(
                  left: 240,
                  top: 90.0,
                  child: Container(
                    child: PositionsWidget(
                      backgroundColor: Constant.app_primary_color,
                      shouldAnimate: true,
                      progressColor: Constant.app_primary_contrast_color_light,
                      lineWidth: 10.0,
                      // outsideText: 'Saad Aslam',
                      insideText: '3rd',
                      radiusData: 130.0,
                      percentageData: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
            child: Text(
              'Top 10 Individuals',
              style: TextStyle(
                color: Constant.app_primary_color,
                fontSize: Constant.h2,
                fontWeight: Constant.app_font_weight,
                letterSpacing: Constant.app_max_letter_spacing,
              ),
            ),
          ),

          // Leader Board Row
          for (int i = 4; i <= 10; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: LeaderBoardRowEntry(
                name: 'Syed Ibtahaj',
                position: i,
              ),
            ),
        ],
      ),
    );
  }
}
