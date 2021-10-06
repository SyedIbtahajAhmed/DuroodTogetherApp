import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataServices/API/generic_api.dart';
import 'package:durood_together_app/Shared/Locator/lcoator.dart';
import 'package:flutter/material.dart';

class DuroodCountVM extends ChangeNotifier {
  Api _api = locator<Api>();


  // Attributes
  Map<String, dynamic> _topCountry = {};
  Map<String, dynamic> _topCity = {};
  int _globalCount = 0;
  String _dateString = '';
  String _currentMonth = '';
  int _currentYear = 0;



  // Getters
  Map<String, dynamic> get topCountry => _topCountry;
  Map<String, dynamic> get topCity => _topCity;
  int get globalCount => _globalCount;
  String get dateString => _dateString;
  String get currentMonth => _currentMonth;
  int get currentYear => _currentYear;




  List<DuroodCount> DuroodCounts;

  setAttributes({
    Map<String, dynamic> topCountry,
    Map<String, dynamic> topCity,
    int globalCount,
  }
      ) {
    this._topCountry = topCountry;
    this._topCity = topCity;
    this._globalCount = globalCount;
  }

  Future<dynamic> fetchDuroodCounts() async {
    var result = await _api.getDataCollection();
    List<DuroodCount> items = [];
    DuroodCounts = result.docs.map((doc) {
      if (doc.id != null) {
        var temp = DuroodCount.fromMap(doc.data(), doc.id.toString());
        items.add(temp);
      }
    }).toList();
    return items;
  }

  Stream<QuerySnapshot> fetchDuroodCountsAsStream() {
    return _api.streamDataCollection();
  }

  Future<DuroodCount> getDuroodCountById(String id) async {
    var doc = await _api.getDocumentById(id);
    // return DuroodCount.fromMap(doc.data());
    return null;
  }

  Future removeDuroodCount(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateDuroodCount(DuroodCount data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addDuroodCount(DuroodCount data) async {
    var result = await _api.addDocument(data.toJson());

    return;
  }
}
