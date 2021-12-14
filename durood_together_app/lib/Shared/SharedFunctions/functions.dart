import 'dart:collection';
import 'dart:math';

import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataModels/UserDuroodCountModel/user-durood-count-model.dart';
import 'package:durood_together_app/Core/DataModels/UserLocation/user_location.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Core/DataViewModels/UserDuroodCountVM/user-durood-count-VM.dart';
import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:durood_together_app/Screens/HomePage%20Screen/HomeScreen/SnackBar/custom-snackbar.dart';
import 'package:durood_together_app/Services/LocationService/location_service.dart';
import 'package:durood_together_app/Shared/Components/AlertDialog/alert-dialog.dart';
import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class Functions {
  // Fetching Durood Count One Time
  Future<Map<String, dynamic>> fetchDuroodCountFromProvider(
    BuildContext context,
    dataDict,
    userDataDict,
    String country,
    String city,
    userId,
  ) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedDict = {};

    duroodCount.forEach((durood) {
      returnedDict[durood.Date.toString()] = {
        'CityData': durood.CityData,
        'CountryData': durood.CountryData,
        'TopFiveCityData': durood.TopFiveCityData,
        'TopFiveCountryData': durood.TopFiveCountryData,
        'UserData': durood.UserData,
        'UserMonthlyData': durood.UserMonthlyData,
        'UserWeeklyData': durood.UserWeeklyData,
      };
    });

    // Setting Data From The Durood Counts Got

    // Current Month Data
    Map<String, dynamic> currentMonthDataGot =
        await getCurrentMonthData(returnedDict, country, city);
    // Previous Month Data
    Map<String, dynamic> previousMonthDataGot =
        await getPreviousMonthDuroodCountData(returnedDict);
    // User Monthly Data
    Map<String, dynamic> userMonthlyDataGot =
        await getUserMonthlyData(returnedDict, userId);

    // User Durood Count Provider Data
    // int userTodayCountGot = await getUserTodayCount(userDataDict, userId);

    // Setting The Attributes
    context.read<DuroodCountVM>().setAttributes(
          currentMonthData: currentMonthDataGot, // Current Month Data
          prevMonthData: previousMonthDataGot, // Previous Month Data
          userMonthlyData: userMonthlyDataGot, // User Monthly Data Got
          // userTodayCount: userTodayCountGot, // User Today Count Got
        );

    // print(context.read<DuroodCountVM>().DuroodCounts);
    return returnedDict;
  }

  // Get Top Country Count With Name
  Future<Map<String, dynamic>> getCurrentMonthData(
      Map<String, dynamic> duroodCount, String country, String city) async {
    // Map<String, dynamic> duroodCount =
    //     context.watch<DuroodCountVM>().DuroodCountsData;
    Map<String, dynamic> returnedDict = {};
    Map<String, dynamic> TopCountry = {};
    Map<String, dynamic> TopFiveCountries = {};
    Map<String, int> TopCity = {};
    Map<String, dynamic> TopFiveCities = {};
    int GlobalCount = 0;
    int myCountryCount = 0;
    int myCityCount = 0;

    if (duroodCount != null && duroodCount.length != 0) {
      // Iterating dataDict
      duroodCount.keys.forEach((durood) {
        if (durood == getDateString()) {
          // Sorting The All Country Data
          dynamic response = SortDictionary(duroodCount[durood]['CountryData']);
          // Now Country Data Is Sorted
          // Getting The Top Country
          // print(response);
          TopCountry[response.keys.elementAt(0)] = response.values.elementAt(0);

          // Top Five Countries
          // Date Matched
          int count = 0;
          dynamic sortedResponse =
              SortDictionary(duroodCount[durood]['CountryData']);
          // Setting Count According To Length Of The Response
          if (duroodCount[durood]['CountryData'].length >= 0 &&
              duroodCount[durood]['CountryData'].length < 5) {
            count = duroodCount[durood]['CountryData'].length;
          } else {
            count = 5;
          }
          for (int i = 0; i < count; i++) {
            // Saving First Top Five
            TopFiveCountries[sortedResponse.keys.elementAt(i)] =
                sortedResponse.values.elementAt(i);
          }

          // Top City
          // Sorting The All City Data
          response = SortDictionary(duroodCount[durood]['CityData']);
          // Now City Data Is Sorted
          // Getting The Top City
          TopCity[response.keys.elementAt(0)] = response.values.elementAt(0);

          // Top Five Cities
          // Date Matched
          count = 0;
          sortedResponse = SortDictionary(duroodCount[durood]['CityData']);
          // Setting Count According To Length Of The Response
          if (duroodCount[durood]['CityData'].length >= 0 &&
              duroodCount[durood]['CityData'].length < 5) {
            count = duroodCount[durood]['CityData'].length;
          } else {
            count = 5;
          }
          for (int i = 0; i < count; i++) {
            // Saving First Top Five
            TopFiveCities[sortedResponse.keys.elementAt(i)] =
                sortedResponse.values.elementAt(i);
          }

          // Global Count
          duroodCount[durood]['CountryData'].values.forEach((element) {
            GlobalCount += element;
          });

          // Getting My Country Count
          duroodCount[durood]['CountryData'].keys.forEach((element) {
            if (element == country) {
              myCountryCount = duroodCount[durood]['CountryData'][element];
            }
          });

          // Getting My City Count
          duroodCount[durood]['CityData'].keys.forEach((element) {
            if (element == city) {
              myCityCount = duroodCount[durood]['CityData'][element];
            }
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

      // Adding In Returned Value Dictionary
      returnedDict['myCountryCount'] =
          myCountryCount; // Index 5 My Country Count

      // Adding In Returned Value Dictionary
      returnedDict['myCityCount'] = myCityCount; // Index 6 My City Count

      // print(returnedValue);
      return returnedDict;
    } else {
      return {};
    }
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
  // Future<int> getGlobalCount(BuildContext context, dataDict) async {
  //   Map<String, dynamic> duroodCount =
  //       context.watch<DuroodCountVM>().DuroodCountsData;
  //   // print(duroodCount);
  //   int returnedValue = 0;
  //
  //   // Iterating dataDict
  //   duroodCount.keys.forEach((durood) {
  //     // returnedValue = 0;
  //     if (durood == getDateString()) {
  //       duroodCount[durood]['CountryData'].values.forEach((element) {
  //         returnedValue += element;
  //       });
  //     }
  //   });
  //   // print("returned Value");
  //   // print(returnedValue);
  //   return returnedValue;
  // }

  // Get User Monthly Data Dictionary
  Future<Map<String, dynamic>> getUserMonthlyData(
      Map<String, dynamic> duroodCount, userId) async {
    // List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    // Map<String, dynamic> duroodCount =
    //     context.watch<DuroodCountVM>().DuroodCountsData;
    Map<String, dynamic> returnedValue = {};

    if (duroodCount != null && duroodCount.length != 0) {
      // Iterating dataDict
      duroodCount.keys.forEach((durood) {
        if (durood == getDateString()) {
          duroodCount[durood]['UserMonthlyData'].keys.forEach((key) {
            if (key == userId) {
              duroodCount[durood]['UserMonthlyData'][key]
                  .keys
                  .forEach((innerKey) {
                // print(innerKey);
                returnedValue[innerKey] =
                    duroodCount[durood]['UserMonthlyData'][key][innerKey];
                // if (key.toString().contains(getCurrentYear().toString())) {
                //   // monthlyCount += value;
                //   // returnedValue[durood.Date.toString()] = value;
                //   // returnedValue[key] = value;
                //   // print('fetched');
                // }
              });
            }
          });
          ;
        }
      });
      // returnedValue[getDateString()] = monthlyCount;

      // print('Returned User Monthly Data' + returnedValue.toString());
      return returnedValue;
    } else {
      return {};
    }
  }

  // Get Weekly Count
  // Future<int> getUserWeeklyCount(userId, dataDict) async {
  //   List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
  //   int returnedValue = 0;
  //
  //   int count = 0;
  //   int weeklyCount = 0;
  //
  //   // Iterating dataDict
  //   duroodCount.forEach((durood) {
  //     if (durood.Date == getDateString()) {
  //       durood.UserMonthlyData.keys.forEach((key) {
  //         if (key == userId) {
  //           durood.UserMonthlyData[key].forEach((key, value) {
  //             if (key.toString().contains(getCurrentYear().toString())) {
  //               // Checking If Day Count is 7 or less for week
  //               if (count < 7) {
  //                 weeklyCount += value;
  //                 count += 1;
  //               }
  //             }
  //           });
  //           // print(weeklyCount);
  //         }
  //       });
  //     }
  //     ;
  //   });
  //   returnedValue = weeklyCount;
  //   return returnedValue;
  // }

  // Get Today Count
  Future<int> getUserTodayCount(dataDict, userId) async {
    // print(userId);
    List<UserDuroodCountModel> userDuroodCount =
        await dataDict.fetchUserDuroodCounts();
    int returnedValue = 0;

    int todayCount = 0;

    // Iterating dataDict
    userDuroodCount.forEach((user) {
      if (user.Uid == userId) {
        user.CountData.keys.forEach((key) {
          if (key == getUserDuroodCountModelDate()) {
            user.CountData[key].values.forEach((valueDict) {
              todayCount += valueDict["count"];
            });
          }
        });
      }
      ;
    });
    returnedValue = todayCount;
    return returnedValue;
  }

  // Get Yesterday Count
  // Future<int> getUserYesterdayCount(userId, dataDict) async {
  //   List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
  //   int returnedValue = 0;
  //
  //   int dayCount = 0;
  //
  //   // Iterating dataDict
  //   duroodCount.forEach((durood) {
  //     if (durood.Date == getDateString()) {
  //       durood.UserMonthlyData.keys.forEach((key) {
  //         if (key == userId) {
  //           durood.UserMonthlyData[key].forEach((key, value) {
  //             if (key.toString().contains((getCurrentDay() - 1).toString())) {
  //               dayCount = value;
  //             }
  //           });
  //           // print(dayCount);
  //         }
  //       });
  //     }
  //     ;
  //   });
  //   returnedValue = dayCount;
  //   // print('Yesterday Count ' + returnedValue.toString());
  //   return returnedValue;
  // }

  // Get Previous Month Data
  Future<Map<String, dynamic>> getPreviousMonthDuroodCountData(
      Map<String, dynamic> duroodCount) async {
    // List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    // Map<String, dynamic> duroodCount =
    //     context.watch<DuroodCountVM>().DuroodCountsData;
    Map<String, dynamic> returnedValue = {};

    if (duroodCount != null && duroodCount.length != 0) {
      // Iterating dataDict

      duroodCount.keys.forEach((durood) {
        if (durood == getPreviousMonthDateString()) {
          // Getting Top Country
          // Sorting The All Country Data
          dynamic topCountry =
              SortDictionary(duroodCount[durood]['CountryData']);
          // Now Country Data Is Sorted
          // Getting The Top Country
          // print(response);
          returnedValue[topCountry.keys.elementAt(0)] =
              topCountry.values.elementAt(0);

          // Getting Top City
          // Sorting The All City Data
          dynamic topCity = SortDictionary(duroodCount[durood]['CityData']);
          // Now City Data Is Sorted
          // Getting The Top City
          // print(response);
          returnedValue[topCity.keys.elementAt(0)] =
              topCity.values.elementAt(0);

          // Getting Previous Month Global Count
          int prevGlobalCount = 0;
          duroodCount[durood]['CountryData'].values.forEach((element) {
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
    } else {
      return {};
    }
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
    String yearString = "";
    if (month == 1) {
      month = 12;
      int year = now.year - 1;
      yearString = year.toString();
    } else {
      month = month - 1;
      yearString = now.year.toString();
    }

    // Declaring Month String Variable
    String monthString = "";
    // Getting Month String
    monthString = Constant().month[month - 1];
    // Formatting The Date String
    String formattedDate = monthString + "_" + yearString;
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
  // String getUserDuroodMonthDate(date) {
  //   // Getting Year From The String
  //   String slicedString = date.replaceAll(new RegExp(r'_'), '');
  //
  //   // print(slicedString);
  //
  //   String numberString = date.replaceAll(new RegExp(r'^_|[^0-9]'), '');
  //   // print(numberString);
  //
  //   String finalString;
  //
  //   int index = 0;
  //   Constant().month.forEach((element) {
  //     // print(element);
  //     if (date.contains(element)) {
  //       // print(Constant().month[index]);
  //       finalString = Constant().months[index] + ' ' + numberString;
  //       // print(finalString);
  //     } else {
  //       index += 1;
  //     }
  //   });
  //   // print(finalString);
  //   return finalString;
  // }

  // Dictionary Sorting
  SplayTreeMap<dynamic, dynamic> SortDictionary(dictionary) {
    final sorted = SplayTreeMap.from(dictionary,
        (key2, key1) => dictionary[key1].compareTo(dictionary[key2]));
    return sorted;
  }

  // Dictionary Sorting
  SplayTreeMap<dynamic, dynamic> SortUserMonthlyDataDictionary(dictionary) {
    int elementCount = 5; // Elements To Get
    Map<String, dynamic> slicedDictionary = {};

    if (dictionary.keys.length > elementCount) {
      for (int i = -1; i >= -elementCount; i--) {
        slicedDictionary[dictionary.keys.elementat(i).toString()] =
            dictionary.values.elementat(i).toString();
      }

      // Sotring Whole Dictionary
      final sorted = SplayTreeMap.from(dictionary,
          (key2, key1) => dictionary[key1].compareTo(dictionary[key2]));

      return sorted;
    } else {
      final sorted = SplayTreeMap.from(dictionary,
          (key2, key1) => dictionary[key1].compareTo(dictionary[key2]));
      return sorted;
    }
  }

  // Durood Count Uploading Function
  void uploadDuroodCount(BuildContext context) async {
    String result = await DuroodCountToFirebase(
        context, context.read<DuroodCountProvider>().duroodCount);

    if (result.toString() == 'DuroodCount Added Successfully.') {
      final snackBar = SnackBar(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 30.0,
        ),
        backgroundColor: Constant.app_primary_contrast_color.withOpacity(0.7),
        content: CustomSnackbar(
          text: 'Durood Count Updated Successfully',
        ),
      );
      context.read<DuroodCountProvider>().resetDuroodCount();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 30.0,
        ),
        backgroundColor: Constant.app_primary_contrast_color.withOpacity(0.7),
        content: CustomSnackbar(
          text: 'Durood Count Updation Unsuccessful',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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

  // Vibration Function
  int setVibration(int duroodCount) {
    if (duroodCount == 100 || (duroodCount % 100) == 0) {
      return 200;
    }
    if ((duroodCount + 1) % 33 == 0) {
      return 90;
    } else {
      return 45;
    }
  }

  // Show Alert Dialog Function
  Future<void> showMyDialog(
      BuildContext context, VoidCallback uploadDurood) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return CustomAlertDialogBox(
          uploadDuroodCount: uploadDurood,
        );
      },
    );
  }

  // Percentage Divider Function
  int percentageDivider(int duroodCount) {
    // Calculating Percentage Based On Durood Count
    if (duroodCount <= 100) {
      return 100;
    } else {
      return duroodCount + 100;
    }
  }
}
