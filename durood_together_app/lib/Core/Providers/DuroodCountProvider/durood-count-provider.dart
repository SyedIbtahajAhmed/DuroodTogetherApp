import 'package:flutter/cupertino.dart';

class DuroodCountProvider extends ChangeNotifier {
  int _duroodCount = 0;

  int get duroodCount => _duroodCount;

  void addDuroodCount() {
    this._duroodCount += 1;
    notifyListeners();
  }

  void resetDuroodCount() {
    this._duroodCount = 0;
    notifyListeners();
  }
}
