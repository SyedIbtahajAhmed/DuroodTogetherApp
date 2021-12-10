import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/home.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ProfileScreen/profile.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/report.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/StatsScreen/stats-screen.dart';
import 'package:flutter/material.dart';

class ScreensRoute {
  static final Map<String, dynamic> Screens = {
    // Screens With Indexes and Icons
    'Home': [Home(), 0, Icons.home_outlined],
    'Report': [Report(), 1, Icons.report_gmailerrorred_outlined],
    'Stats': [StatisticsScreen(), 2, Icons.info_outlined],
    'Profile': [Profile(), 3, Icons.account_circle_outlined],
  };
}
