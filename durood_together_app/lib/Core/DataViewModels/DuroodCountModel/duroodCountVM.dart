import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataServices/API/appConst.dart';
import 'package:durood_together_app/Core/DataServices/API/generic_api.dart';
import 'package:durood_together_app/Shared/Locator/lcoator.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class DuroodCountVM extends ChangeNotifier {
  Api _api = locator<Api>();

  // Attributes
  Map<String, dynamic> _topCountry = {};
  Map<String, dynamic> _topCity = {};
  int _globalCount = 0;
  Map<String, dynamic> _topFiveCountries = {};
  Map<String, dynamic> _topFiveCities = {};
  Map<String, dynamic> _userMonthlyData = {};
  int _userWeeklyCount = 0;
  int _userTodayCount = 0;
  int _userYesterdayCount = 0;

  String _dateString = '';
  String _currentMonth = '';
  int _currentYear = 0;

  // Getters
  Map<String, dynamic> get topCountry => _topCountry;
  Map<String, dynamic> get topCity => _topCity;
  int get globalCount => _globalCount;
  Map<String, dynamic> get topFiveCountries => _topFiveCountries;
  Map<String, dynamic> get topFiveCities => _topFiveCities;
  Map<String, dynamic> get userMonthlyData => _userMonthlyData;
  int get userWeeklyCount => _userWeeklyCount;
  int get userTodayCount => _userTodayCount;
  int get userYesterdayCount => _userYesterdayCount;

  String get dateString => _dateString;
  String get currentMonth => _currentMonth;
  int get currentYear => _currentYear;

  List<DuroodCount> DuroodCounts;

  setAttributes({
    Map<String, dynamic> topCountry,
    Map<String, dynamic> topCity,
    int globalCount,
    Map<String, dynamic> topFiveCountries,
    Map<String, dynamic> topFiveCities,
    Map<String, dynamic> userMonthlyData,
    int userWeeklyCount,
    int userTodayCount,
    int userYesterdayCount,
  }) {
    this._topCountry = topCountry;
    this._topCity = topCity;
    this._globalCount = globalCount;
    this._topFiveCountries = topFiveCountries;
    this._topFiveCities = topFiveCities;
    this._userMonthlyData = userMonthlyData;
    this._userWeeklyCount = userWeeklyCount;
    this._userTodayCount = userTodayCount;
    this._userYesterdayCount = userYesterdayCount;
  }

  resetAttributes() {
    this._topCountry = {};
    this._topCity = {};
    this._globalCount = 0;
    this._topFiveCountries = {};
    this._topFiveCities = {};
    this._userMonthlyData = {};
    this._userWeeklyCount = 0;
    this._userTodayCount = 0;
    this._userYesterdayCount = 0;
  }

  Future<dynamic> fetchDuroodCounts() async {
    // Changing Collection Path
    _api.changePath(AppConst.durrodCountCollection);
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

  Future<String> addCustomDuroodCount(
      BuildContext context, Map<String, dynamic> data, String date) async {
    // Changing Collection Path
    _api.changePath(AppConst.durrodCountCollection);

    // Making Data
    // Making Temporary Objects
    DuroodCount mapObject = new DuroodCount();

    // City Value
    mapObject.CityData = {
      data['City']: FieldValue.increment(data['DuroodCount'])
    };

    // Country Value
    mapObject.CountryData = {
      data['Country']: FieldValue.increment(data['DuroodCount'])
    };
    // UserData Value
    mapObject.UserData = {
      data['User']: FieldValue.increment(data['DuroodCount'])
    };
    // UserMonthlyData
    mapObject.UserMonthlyData = {
      context.read<User>().uid: {
        Functions().getDayDateString():
            FieldValue.increment(data['DuroodCount'])
      }
    };
    // TopFiveCities
    print(mapObject.toJson());

    // Getting Data
    await _api.addCustomDocument(mapObject.toJson(), date);
    // print(result);
    return 'DuroodCount Added Successfully.';
  }

  Future addDuroodCount(DuroodCount data) async {
    var result = await _api.addDocument(data.toJson());

    return;
  }
}
