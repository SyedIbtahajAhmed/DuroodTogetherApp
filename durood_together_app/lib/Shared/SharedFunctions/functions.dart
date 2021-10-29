import 'dart:collection';

import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';

class Functions {
  // Get Top Country Count With Name
  Future<Map<String, dynamic>> getTopCountry(dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedValue = {};

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        // Sorting The All City Data
        dynamic response = SortDictionary(durood.CountryData);
        // Now City Data Is Sorted
        // Getting The Top City
        print(response);
        returnedValue[response.keys.elementAt(0)] =
            response.values.elementAt(0);
      }
      ;
    });
    return returnedValue;
  }

  // Get Top Countries Dictionary
  Future<Map<String, dynamic>> getTopFiveCountries(dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedValue = {};

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        // Date Matched
        int count = 0;
        dynamic sortedResponse = SortDictionary(durood.CountryData);
        // Setting Count According To Length Of The Response
        if (durood.CountryData.length >= 0 && durood.CountryData.length < 5) {
          count = durood.CountryData.length;
        } else {
          count = 5;
        }
        for (int i = 0; i < count; i++) {
          // Saving First Top Five
          returnedValue[durood.CountryData.keys.elementAt(i)] =
              durood.CountryData.values.elementAt(i);
        }
      }
      ;
    });
    return returnedValue;
  }

  // Get Top City Count With Name
  Future<Map<String, int>> getTopCity(dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, int> returnedValue = {};

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        // Sorting The All City Data
        dynamic response = SortDictionary(durood.CityData);
        // Now City Data Is Sorted
        // Getting The Top City
        returnedValue[response.keys.elementAt(0)] =
            response.values.elementAt(0);
      }
      ;
    });
    return returnedValue;
  }

  // Get Top Cities Dictionary
  Future<Map<String, dynamic>> getTopFiveCities(dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedValue = {};

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        // Date Matched
        int count = 0;
        dynamic sortedResponse = SortDictionary(durood.CityData);
        // Setting Count According To Length Of The Response
        if (durood.CityData.length >= 0 && durood.CityData.length < 5) {
          count = durood.CityData.length;
        } else {
          count = 5;
        }
        for (int i = 0; i < count; i++) {
          // Saving First Top Five
          returnedValue[durood.CityData.keys.elementAt(i)] =
              durood.CityData.values.elementAt(i);
        }
      }
      ;
    });
    return returnedValue;
  }

  // Getting Total Global Count
  Future<int> getGlobalCount(dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    int returnedValue = 0;

    // Iterating dataDict
    duroodCount.forEach((durood) {
      // returnedValue = 0;
      if (durood.Date == getDateString()) {
        durood.CountryData.values.forEach((element) {
          returnedValue += element;
        });
      }
    });
    // print("returned Value");
    // print(returnedValue);
    return returnedValue;
  }

  // Get User Monthly Data Dictionary
  Future<Map<String, dynamic>> getUserMonthlyData(userId, dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedValue = {};

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        durood.UserMonthlyData.keys.forEach((key) {
          if (key == userId) {
            returnedValue = durood.UserMonthlyData[key];
          }
        });
      }
      ;
    });
    // print(returnedValue);
    return returnedValue;
  }

  // Getting Date String
  String getDateString() {
    // Getting Current DateTime
    DateTime now = new DateTime.now();
    // Extracting Month And Year
    int month = now.month;
    String year = now.year.toString();
    // Declaring Month String Variable
    String monthString = "";
    // Getting Month String
    monthString = Constant().month[month - 1];
    // Formatting The Date String
    String formattedDate = monthString + "_" + year;
    return formattedDate;
  }

  // Getting Month
  String getCurrentMonth() {
    // Getting Current Date
    DateTime now = new DateTime.now();
    // Extracting Month And Returning Month
    int month = now.month;
    // Returning
    return Constant().months[month - 1];
  }

  // Getting Year
  int getCurrentYear() {
    // Getting Current Date
    DateTime now = new DateTime.now();
    // Extracting Month And Returning Month
    int year = now.year;
    // Returning
    return year;
  }

  // User Durood Count Date Maker
  String getUserDuroodMonthDate(date) {
    // Getting Year From The String
    String slicedString = date.replaceAll(new RegExp(r'_'), '');

    print(slicedString);

    String numberString = date.replaceAll(new RegExp(r'^_|[^0-9]'), '');
    print(numberString);

    String finalString;

    int index = 0;
    Constant().month.forEach((element) {
      // print(element);
      if (date.contains(element)) {
        // print(Constant().month[index]);
        finalString = Constant().months[index] + ' ' + numberString;
        // print(finalString);
      } else {
        index += 1;
      }
    });
    print(finalString);
    return finalString;
  }

  // Dictionary Sorting
  SplayTreeMap<dynamic, dynamic> SortDictionary(dictionary) {
    final sorted = SplayTreeMap.from(dictionary,
        (key2, key1) => dictionary[key1].compareTo(dictionary[key2]));
    return sorted;
  }
}
