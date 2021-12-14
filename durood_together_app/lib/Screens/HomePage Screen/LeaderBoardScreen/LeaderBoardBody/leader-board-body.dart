import 'package:durood_together_app/Screens/HomePage%20Screen/LeaderBoardScreen/LeaderBoardBody/LeaderBoardBodyChild/leader-board-body-child.dart';
import 'package:flutter/material.dart';

class LeaderBoardBody extends StatefulWidget {
  const LeaderBoardBody({Key key}) : super(key: key);

  @override
  _LeaderBoardBodyState createState() => _LeaderBoardBodyState();
}

class _LeaderBoardBodyState extends State<LeaderBoardBody> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 1000),
      tween: Tween(begin: 1.0, end: 0.0),
      curve: Curves.easeInOutCubicEmphasized,
      child: LeaderBoardBodyChild(),
      builder: (context, bodyValue, Widget child) {
        return Transform.translate(
          offset: Offset(0.0, 400.0 * bodyValue),
          child: Container(child: child),
        );
      },
    );
  }
}
