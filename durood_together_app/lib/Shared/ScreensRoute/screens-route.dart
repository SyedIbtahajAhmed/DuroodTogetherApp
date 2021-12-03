import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/home.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ProfileScreen/profile.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/ReportScreen/report.dart';
import 'package:flutter/material.dart';

class ScreensRoute {
  static final Map<String, dynamic> Screens = {
    // Screens With Indexes and Icons
    'Home': [Home(), 0, Icons.home_outlined],
    'Report': [Report(), 1, Icons.report_gmailerrorred_outlined],
    'Profile': [Profile(), 2, Icons.account_circle_outlined],
  };
}
