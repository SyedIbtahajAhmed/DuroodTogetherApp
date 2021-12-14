import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LeaderBoardBodyChild/leader-board-body-child.dart';
import 'LeaderBoardHeaderChild/leader-board-header-child.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key key}) : super(key: key);

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Leaderboard Header
          // LeaderBoardHeader(),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1500),
            tween: Tween(begin: 0.0, end: 1.0),
            curve: Curves.easeInOutCubicEmphasized,
            child: LeaderBoardHeaderChild(),
            builder: (context, headerValue, Widget child) {
              return Container(
                width: double.infinity,
                height: screenSize.height * 0.31 * headerValue,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight:
                        Radius.circular(Constant.app_headers_border_radius),
                    bottomLeft:
                        Radius.circular(Constant.app_headers_border_radius),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Constant.app_primary_contrast_color.withOpacity(0.3),
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
          ),

          // Leaderboard Body
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1000),
            tween: Tween(begin: 1.0, end: 0.0),
            curve: Curves.easeInOutCubicEmphasized,
            child: LeaderBoardBodyChild(),
            builder: (context, bodyValue, Widget child) {
              return Transform.translate(
                offset: Offset(0.0, 500.0 * bodyValue),
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
