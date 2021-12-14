import 'package:durood_together_app/Screens/HomePage%20Screen/LeaderBoardScreen/LeaderBoardBody/leader-board-body.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/LeaderBoardScreen/LeaderBoardHeader/leader-board-header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key key}) : super(key: key);

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  double headingContainerHeight;

  @override
  void initState() {
    // TODO: implement initState
    this.headingContainerHeight = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Leaderboard Header
          LeaderBoardHeader(),

          // Leaderboard Body
          LeaderBoardBody(),
        ],
      ),
    );
  }
}
