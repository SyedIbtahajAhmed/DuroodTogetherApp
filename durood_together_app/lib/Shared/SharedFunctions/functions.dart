import 'dart:collection';

import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataModels/UserLocation/user_location.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Core/DataViewModels/UserDuroodCountVM/user-durood-count-VM.dart';
import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

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
        // print(response);
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

    int monthlyCount = 0;

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        durood.UserMonthlyData.keys.forEach((key) {
          if (key == userId) {
            durood.UserMonthlyData[key].forEach((key, value) {
              if (key.toString().contains(getCurrentYear().toString())) {
                monthlyCount += value;
              }
            });
            // print(monthlyCount);
          }
        });
      }
      ;
    });
    returnedValue[getDateString()] = monthlyCount;
    return returnedValue;
  }

  // Get Weekly Count
  Future<int> getUserWeeklyCount(userId, dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    int returnedValue = 0;

    int count = 0;
    int weeklyCount = 0;

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        durood.UserMonthlyData.keys.forEach((key) {
          if (key == userId) {
            durood.UserMonthlyData[key].forEach((key, value) {
              if (key.toString().contains(getCurrentYear().toString())) {
                // Checking If Day Count is 7 or less for week
                if (count < 7) {
                  weeklyCount += value;
                  count += 1;
                }
              }
            });
            // print(weeklyCount);
          }
        });
      }
      ;
    });
    returnedValue = weeklyCount;
    return returnedValue;
  }

  // Get Today Count
  Future<int> getUserTodayCount(userId, dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    int returnedValue = 0;

    int dayCount = 0;

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        durood.UserMonthlyData.keys.forEach((key) {
          if (key == userId) {
            durood.UserMonthlyData[key].forEach((key, value) {
              if (key.toString().contains(getDayDateString().toString())) {
                dayCount = value;
              }
            });
            // print(dayCount);
          }
        });
      }
      ;
    });
    returnedValue = dayCount;
    return returnedValue;
  }

  // Get Yesterday Count
  Future<int> getUserYesterdayCount(userId, dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    int returnedValue = 0;

    int dayCount = 0;

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        durood.UserMonthlyData.keys.forEach((key) {
          if (key == userId) {
            durood.UserMonthlyData[key].forEach((key, value) {
              if (key.toString().contains((getCurrentDay() - 1).toString())) {
                dayCount = value;
              }
            });
            // print(dayCount);
          }
        });
      }
      ;
    });
    returnedValue = dayCount;
    // print('Yesterday Count ' + returnedValue.toString());
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

  // Getting Date String For UserMonthlyDailyData
  String getDayDateString() {
    // Getting Current DateTime
    DateTime now = new DateTime.now();
    // Extracting Month And Year
    int day = now.day;
    int month = now.month;
    String year = now.year.toString();
    // Declaring Month String Variable
    String monthString = "";
    // Getting Month String
    monthString = Constant().month[month - 1];
    // Formatting The Date String
    String formattedDate = day.toString() + " " + monthString + " " + year;
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

  // Getting Day
  int getCurrentDay() {
    // Getting Current Date
    DateTime now = new DateTime.now();
    // Extracting Month And Returning Month
    int day = now.day;
    // Returning
    return day;
  }

  String getUserDuroodCountModelDate() {
    DateTime now = new DateTime.now();
    int month = now.month;
    int year = now.year;
    int day = now.day;

    String returnedDate =
        year.toString() + '-' + month.toString() + '-' + day.toString();

    return returnedDate;
  }

  String getUserDuroodCountModelDateAndTime() {
    DateTime now = new DateTime.now();
    int month = now.month;
    int year = now.year;
    int day = now.day;

    // Formatting Data
    String returnedDate =
        year.toString() + '-' + month.toString() + '-' + day.toString();

    String time = DateFormat.Hms().format(now);

    returnedDate = returnedDate + ' ' + time.toString();
    // print(returnedDate);

    return returnedDate;
  }

  // User Durood Count Date Maker
  String getUserDuroodMonthDate(date) {
    // Getting Year From The String
    String slicedString = date.replaceAll(new RegExp(r'_'), '');

    // print(slicedString);

    String numberString = date.replaceAll(new RegExp(r'^_|[^0-9]'), '');
    // print(numberString);

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
    // print(finalString);
    return finalString;
  }

  // Dictionary Sorting
  SplayTreeMap<dynamic, dynamic> SortDictionary(dictionary) {
    final sorted = SplayTreeMap.from(dictionary,
        (key2, key1) => dictionary[key1].compareTo(dictionary[key2]));
    return sorted;
  }

  // Durood Count Save Function
  Future<String> DuroodCountToFirebase(
      BuildContext context, int duroodCount) async {
    Map<String, dynamic> duroodCountObject = new Map<String, dynamic>();
    Map<String, dynamic> userDuroodCountObject = new Map<String, dynamic>();

    // Storing Data
    duroodCountObject['City'] =
        context.read<LocationService>().userAddress[0].locality.toString();
    duroodCountObject['Country'] =
        context.read<LocationService>().userAddress[0].country.toString();
    duroodCountObject['User'] = context.read<User>().uid;
    duroodCountObject['DuroodCount'] =
        context.read<DuroodCountProvider>().duroodCount;

    //dataObject2
    userDuroodCountObject['UserId'] = context.read<User>().uid;
    userDuroodCountObject['CountData'] = {
      Functions().getUserDuroodCountModelDate(): {
        Functions().getUserDuroodCountModelDateAndTime(): {
          "CityName": context
              .read<LocationService>()
              .userAddress[0]
              .locality
              .toString(),
          "CountryName":
              context.read<LocationService>().userAddress[0].country.toString(),
          "Lat": context.read<UserLocation>().latitude,
          "Log": context.read<UserLocation>().longitude,
          "TimeStamp": Functions().getUserDuroodCountModelDateAndTime(),
          "count": duroodCount,
        }
      }
    };

    // Adding In DuroodCount
    await DuroodCountVM().addCustomDuroodCount(
        context, duroodCountObject, Functions().getDateString());

    // Adding In CustomUserDuroodCount
    dynamic result2 = await UserDuroodCountVM()
        .addCustomUserDuroodCount(context, userDuroodCountObject);
    // print(Functions().getDayDateString());

    return result2;
  }
}
