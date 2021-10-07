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
        int count = 0;
        durood.TopFiveCountryData.values.forEach((element) {
          if (element > count) {
            count = element;
          }
        });
        // Getting The Top Country
        durood.TopFiveCountryData.keys.forEach((element) {
          // We Have Keys in Elements
          if (durood.TopFiveCountryData[element] == count) {
            returnedValue[element] = count;
          }
          ;
        });
      }
      ;
    });
    return returnedValue;
  }



  // Get Top Country Dictionary
  Future<Map<String, dynamic>> getTopCountries(dataDict) async {
    List<DuroodCount> duroodCount = await dataDict.fetchDuroodCounts();
    Map<String, dynamic> returnedValue = {};

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == getDateString()) {
        int count = 0;
        durood.TopFiveCountryData.values.forEach((element) {
          if (element > count) {
            count = element;
          }
        });
        // Getting The Top Country
        durood.TopFiveCountryData.keys.forEach((element) {
          // We Have Keys in Elements
          if (durood.TopFiveCountryData[element] == count) {
            returnedValue[element] = count;
          }
          ;
        });
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
        int count = 0;
        durood.TopFiveCityData.values.forEach((element) {
          if (element > count) {
            count = element;
          }
        });
        // Getting The Top Country
        durood.TopFiveCityData.keys.forEach((element) {
          // We Have Keys in Elements
          if (durood.TopFiveCityData[element] == count) {
            returnedValue[element] = count;
          }
          ;
        });
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
}
