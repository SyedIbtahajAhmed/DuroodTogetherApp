import 'package:durood_together_app/Screens/HomePage%20Screen/LeaderBoardScreen/LeaderBoardBody/LeaderBoardBodyChild/LeaderBoardRowEntry/leader-board-row-entry.dart';
import 'package:durood_together_app/Shared/Components/PositionsWidget/positions-widget.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderBoardBodyChild extends StatefulWidget {
  const LeaderBoardBodyChild({Key key}) : super(key: key);

  @override
  _LeaderBoardBodyChildState createState() => _LeaderBoardBodyChildState();
}

class _LeaderBoardBodyChildState extends State<LeaderBoardBodyChild> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        // Positins Stack
        Container(
          color: Constant.app_primary_contrast_color,
          width: screenSize.width < 350 ? 330 : 380,
          height: 220.0,
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
                    radiusData: 110.0,
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
                    radiusData: 140.0,
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
                    radiusData: 110.0,
                    percentageData: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Leader Board Row
        for (int i = 1; i <= 10; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: LeaderBoardRowEntry(
              position: i,
            ),
          ),
      ],
    );
  }
}
