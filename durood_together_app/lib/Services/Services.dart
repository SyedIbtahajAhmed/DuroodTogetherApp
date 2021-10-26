import 'dart:collection';

import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Shared/SharedFunctions/functions.dart';

class Services {
  // Updating TopFiveCitiesData
  Future<Map<String, dynamic>> updateTopFiveCities() async {
    // Getting All Cities Data
    List<DuroodCount> duroodCount = await DuroodCountVM().fetchDuroodCounts();
    Map<String, dynamic> returnedValue = {};
    int count = 0;

    // Iterating dataDict
    duroodCount.forEach((durood) {
      if (durood.Date == Functions().getDateString()) {
        // Making a Dictionary
        SplayTreeMap<dynamic, dynamic> tempDict =
            Functions().SortDictionary(durood.CityData);

        if (durood.CityData.length >= 0 && durood.CityData.length < 5) {
          count = durood.CityData.length;
        } else {
          count = 5;
        }

        // Taking Top Five Cities
        for (int i = 0; i < count; i++) {
          returnedValue[tempDict.keys.elementAt(i).toString()] =
              tempDict.values.elementAt(i);
        }

        print(returnedValue);
      }
      ;
    });
    return returnedValue;
  }
}
