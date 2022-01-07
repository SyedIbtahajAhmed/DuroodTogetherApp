import 'package:durood_together_app/Screens/HomePage%20Screen/FriendsScreen/friends-screen.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/home.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/LeaderBoardScreen/leader-board-screen.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ProfileScreen/profile.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/report.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/StatsScreen/stats-screen.dart';
import 'package:flutter/material.dart';

class ScreensRoute {
  static final Map<String, dynamic> Screens = {
    // Screens With Indexes and Icons
    'Stats': [StatisticsScreen(), 0, Icons.backup_table],
    'Report': [Report(), 1, Icons.report_gmailerrorred_outlined],
    'Home': [Home(), 2, Icons.home_outlined],
    'Boards': [LeaderBoardScreen(), 3, Icons.leaderboard],
    'Setting': [Profile(), 4, Icons.account_circle_outlined],
    'Friends': [FriendsScreen(), 5, Icons.supervised_user_circle_rounded],
  };
}
