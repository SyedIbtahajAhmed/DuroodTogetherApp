import 'package:flutter/cupertino.dart';

class DuroodCountProvider extends ChangeNotifier {
  int _duroodCount = 0;
  int _duroodCountField = 0;

  int get duroodCount => _duroodCount;
  int get duroodCountField => _duroodCountField;

  void addDuroodCount() {
    this._duroodCount += 1;
    this._duroodCountField += 1;
    notifyListeners();
  }

  void duroodCountFromField(int count) {
    this._duroodCountField = count;
    notifyListeners();
  }

  void resetDuroodCount() {
    this._duroodCount = 0;
    this._duroodCountField = 0;
    notifyListeners();
  }
}
