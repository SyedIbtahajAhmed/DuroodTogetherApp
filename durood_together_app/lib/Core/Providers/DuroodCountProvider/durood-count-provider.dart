import 'package:flutter/cupertino.dart';

class DuroodCountProvider extends ChangeNotifier {
  int _duroodCount = 0;
  int _duroodCountField = 0;

  Map<String, dynamic> _todayDuroodCountMap = {}; // Today Durood Count Map

  int get duroodCount => _duroodCount;
  int get duroodCountField => _duroodCountField;
  Map<String, dynamic> get todayDuroodCountMap => _todayDuroodCountMap;

  void addDuroodCount() {
    this._duroodCount += 1;
    this._duroodCountField += 1;
    // // Updating Today Durood Count
    // updateTodayDuroodCount(Functions().getUserDuroodCountModelDate(), 1);
    notifyListeners();
  }

  void duroodCountFromField(int count) {
    this._duroodCountField = count;
    this._duroodCount = count;
    // // Updating Today Durood Count
    // updateTodayDuroodCount(Functions().getUserDuroodCountModelDate(), count);
    notifyListeners();
  }

  void resetDuroodCount() {
    this._duroodCount = 0;
    this._duroodCountField = 0;
    this._todayDuroodCountMap = {};
    notifyListeners();
  }

  // Updating Today Durood Count
  // void updateTodayDuroodCount(String date, int count) {
  //   _todayDuroodCountMap[date] += count;
  // }
}
