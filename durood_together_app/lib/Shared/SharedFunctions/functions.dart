import 'dart:collection';
import 'dart:math';

import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataModels/UserLocation/user_location.dart';
import 'package:durood_together_app/Core/DataViewModels/UserDuroodCountVM/user-durood-count-VM.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class Functions {
  // Get Top Country Count With Name
  Future<Map<String, dynamic>> getCurrentMonthData(dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedDict = {};
    Map<String, dynamic> TopCountry = {};
    Map<String, dynamic> TopFiveCountries = {};
    Map<String, int> TopCity = {};
    Map<String, dynamic> TopFiveCities = {};
    int GlobalCount = 0;

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        // Sorting The All Country Data
        dynamic response = SortDictionary(durood.CountryData);
        // Now Country Data Is Sorted
        // Getting The Top Country
        // print(response);
        TopCountry[response.keys.elementAt(0)] = response.values.elementAt(0);

        // Top Five Countries
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
          TopFiveCountries[durood.CountryData.keys.elementAt(i)] =
              durood.CountryData.values.elementAt(i);
        }

        // Top City
        // Sorting The All City Data
        response = SortDictionary(durood.CityData);
        // Now City Data Is Sorted
        // Getting The Top City
        TopCity[response.keys.elementAt(0)] = response.values.elementAt(0);

        // Top Five Cities
        // Date Matched
        count = 0;
        sortedResponse = SortDictionary(durood.CityData);
        // Setting Count According To Length Of The Response
        if (durood.CityData.length >= 0 && durood.CityData.length < 5) {
          count = durood.CityData.length;
        } else {
          count = 5;
        }
        for (int i = 0; i < count; i++) {
          // Saving First Top Five
          TopFiveCities[durood.CityData.keys.elementAt(i)] =
              durood.CityData.values.elementAt(i);
        }

        // Global Count
        durood.CountryData.values.forEach((element) {
          GlobalCount += element;
        });
      }
      ;
    });

    // Adding In Returned Value Dictionary
    returnedDict[TopCountry.keys.elementAt(0)] =
        TopCountry.values.elementAt(0); // Index 0 Top Country

    // Adding In Returned Value Dictionary
    returnedDict['topFiveCountriesDictionary'] =
        TopFiveCountries; // Index 1 Top Five Countries

    // Adding In Returned Value Dictionary
    returnedDict[TopCity.keys.elementAt(0)] =
        TopCity.values.elementAt(0); // Index 2 Top City

    // Adding In Returned Value Dictionary
    returnedDict['topFiveCitiesDictionary'] =
        TopFiveCities; // Index 3 Top Five Cities

    // Adding In Returned Value Dictionary
    returnedDict['GlobalCount'] = GlobalCount; // Index 4 Top City

    // print(returnedValue);
    return returnedDict;
  }

  // Get Top Countries Dictionary
  // Future<Map<String, dynamic>> getTopFiveCountries(dataDict) async {
  //   List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
  //   Map<String, dynamic> returnedValue = {};
  //
  //   // Iterating dataDict
  //   duroodCount.forEach((durood) {
  //     if (durood.Date == getDateString()) {
  //       // Date Matched
  //       int count = 0;
  //       dynamic sortedResponse = SortDictionary(durood.CountryData);
  //       // Setting Count According To Length Of The Response
  //       if (durood.CountryData.length >= 0 && durood.CountryData.length < 5) {
  //         count = durood.CountryData.length;
  //       } else {
  //         count = 5;
  //       }
  //       for (int i = 0; i < count; i++) {
  //         // Saving First Top Five
  //         returnedValue[durood.CountryData.keys.elementAt(i)] =
  //             durood.CountryData.values.elementAt(i);
  //       }
  //     }
  //     ;
  //   });
  //   return returnedValue;
  // }

  // Get Top City Count With Name
  // Future<Map<String, int>> getTopCity(dataDict) async {
  //   List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
  //   Map<String, int> returnedValue = {};
  //
  //   // Iterating dataDict
  //   duroodCount.forEach((durood) {
  //     if (durood.Date == getDateString()) {
  //       // Sorting The All City Data
  //       dynamic response = SortDictionary(durood.CityData);
  //       // Now City Data Is Sorted
  //       // Getting The Top City
  //       returnedValue[response.keys.elementAt(0)] =
  //           response.values.elementAt(0);
  //     }
  //     ;
  //   });
  //   return returnedValue;
  // }

  // Get Top Cities Dictionary
  // Future<Map<String, dynamic>> getTopFiveCities(dataDict) async {
  //   List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
  //   Map<String, dynamic> returnedValue = {};
  //
  //   // Iterating dataDict
  //   duroodCount.forEach((durood) {
  //     if (durood.Date == getDateString()) {
  //       // Date Matched
  //       int count = 0;
  //       dynamic sortedResponse = SortDictionary(durood.CityData);
  //       // Setting Count According To Length Of The Response
  //       if (durood.CityData.length >= 0 && durood.CityData.length < 5) {
  //         count = durood.CityData.length;
  //       } else {
  //         count = 5;
  //       }
  //       for (int i = 0; i < count; i++) {
  //         // Saving First Top Five
  //         returnedValue[durood.CityData.keys.elementAt(i)] =
  //             durood.CityData.values.elementAt(i);
  //       }
  //     }
  //     ;
  //   });
  //   return returnedValue;
  // }

  // Getting Total Global Count
  // Future<int> getGlobalCount(dataDict) async {
  //   List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
  //   int returnedValue = 0;
  //
  //   // Iterating dataDict
  //   duroodCount.forEach((durood) {
  //     // returnedValue = 0;
  //     if (durood.Date == getDateString()) {
  //       durood.CountryData.values.forEach((element) {
  //         returnedValue += element;
  //       });
  //     }
  //   });
  //   // print("returned Value");
  //   // print(returnedValue);
  //   return returnedValue;
  // }

  // Get User Monthly Data Dictionary
  Future<Map<String, dynamic>> getUserMonthlyData(userId, dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedValue = {};

    int monthlyCount = 0;

    // Iterating dataDict
    duroodCount.forEach((durood) {
      // print(durood.Date.toString());
      // if (durood.Date == getDateString()) {
      durood.UserMonthlyData.keys.forEach((key) {
        if (key == userId) {
          durood.UserMonthlyData[key].forEach((key, value) {
            if (key.toString().contains(getCurrentYear().toString())) {
              // monthlyCount += value;
              // returnedValue[durood.Date.toString()] = value;
              returnedValue[key] = value;
            }
          });
          // print(monthlyCount);
        }
      });
      // }
      ;
    });
    // returnedValue[getDateString()] = monthlyCount;
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

  // Get Previous Month Data
  Future<Map<String, dynamic>> getPreviousMonthDuroodCountData(dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedValue = {};

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getPreviousMonthDateString()) {
        // Getting Top Country
        // Sorting The All Country Data
        dynamic topCountry = SortDictionary(durood.CountryData);
        // Now Country Data Is Sorted
        // Getting The Top Country
        // print(response);
        returnedValue[topCountry.keys.elementAt(0)] =
            topCountry.values.elementAt(0);

        // Getting Top City
        // Sorting The All City Data
        dynamic topCity = SortDictionary(durood.CityData);
        // Now City Data Is Sorted
        // Getting The Top City
        // print(response);
        returnedValue[topCity.keys.elementAt(0)] = topCity.values.elementAt(0);

        // Getting Previous Month Global Count
        int prevGlobalCount = 0;
        durood.CountryData.values.forEach((element) {
          prevGlobalCount += element;
        });
        // Global Count Generated
        // Saving In the dictionary
        returnedValue['PrevGlobalCount'] = prevGlobalCount;
      }
      ;
    });
    // returnedValue = dayCount;
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

  // Getting Previous Month Date String
  String getPreviousMonthDateString() {
    // Getting Current DateTime
    DateTime now = new DateTime.now();
    // Extracting Month And Year
    int month = now.month;
    month = month - 1;
    String year = now.year.toString();
    // Declaring Month String Variable
    String monthString = "";
    // Getting Month String
    monthString = Constant().month[month - 1];
    // Formatting The Date String
    String formattedDate = monthString + "_" + year;
    // print(formattedDate);
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

  // Getting Previous Month
  String getPreviousMonth() {
    // Getting Current Date
    DateTime now = new DateTime.now();
    // Extracting Month And Returning Month
    int month = now.month - 1;
    // Returning
    return Constant().months[month - 1];
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
    // Map<String, dynamic> duroodCountObject = new Map<String, dynamic>();
    Map<String, dynamic> userDuroodCountObject = new Map<String, dynamic>();

    // Storing Data
    // duroodCountObject['City'] =
    //     context.read<LocationService>().userAddress[0].locality.toString();
    // duroodCountObject['Country'] =
    //     context.read<LocationService>().userAddress[0].country.toString();
    // duroodCountObject['User'] = context.read<User>().uid;
    // duroodCountObject['DuroodCount'] =
    //     context.read<DuroodCountProvider>().duroodCount;

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
    // await DuroodCountVM().addCustomDuroodCount(
    //     context, duroodCountObject, Functions().getDateString());

    // Adding In CustomUserDuroodCount
    dynamic result2 = await UserDuroodCountVM()
        .addCustomUserDuroodCount(context, userDuroodCountObject);
    // print(Functions().getDayDateString());

    return result2;
  }

  // Number Conversion To Notation
  // Usama Bhai Function
  String ConvertNumber(String count) {
    // List notationArray = ['K', 'M', 'B'];

    // int digitCount = count.toString().length;
    // count = Numeral(1099).value();
    String notation = "";
    if (RegExp(r'[a-zA-Z]').hasMatch(count)) {
      notation = count[count.length - 1];
      count = count.substring(0, count.length - 1);
    } else {
      return count;
    }
    // print(count);
    double number = double.parse(count);
    String newDouble = '${truncateToDecimalPlaces(number, 2)}';
    if (newDouble.substring(newDouble.indexOf("."), newDouble.length).length <
        3) {
      newDouble += "0";
    }
    String newCount = newDouble + notation;
    // print(newCount);
    return newCount;
  }

  double truncateToDecimalPlaces(num value, int fractionalDigits) =>
      (value * pow(10, fractionalDigits)).truncate() /
      pow(10, fractionalDigits);
}
