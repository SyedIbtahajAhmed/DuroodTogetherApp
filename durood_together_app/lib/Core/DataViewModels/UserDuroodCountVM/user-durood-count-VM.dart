import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataModels/UserDuroodCountModel/user-durood-count-model.dart';
import 'package:durood_together_app/Core/DataServices/API/appConst.dart';
import 'package:durood_together_app/Core/DataServices/API/generic_api.dart';
import 'package:durood_together_app/Shared/Locator/lcoator.dart';
import 'package:flutter/cupertino.dart';

class UserDuroodCountVM extends ChangeNotifier {
  Api _api = locator<Api>();

  List<UserDuroodCountModel> users;

  Future<dynamic> fetchUserDuroodCounts() async {
    // Changing Collection Path
    _api.changePath(AppConst.userDuroodCountCollection);
    var result = await _api.getDataCollection();
    List<UserDuroodCountModel> items = [];
    users = result.docs.map((doc) {
      if (doc.id != null) {
        var temp = UserDuroodCountModel.fromMap(doc.data(), doc.id.toString());
        items.add(temp);
      }
    }).toList();
    return items;
  }

  Stream<QuerySnapshot> fetchUserDuroodCountsAsStream() {
    return _api.streamDataCollection();
  }

  Future<DuroodCount> getUserDuroodCountsCountById(String id) async {
    var doc = await _api.getDocumentById(id);
    // return DuroodCount.fromMap(doc.data());
    return null;
  }

  Future removeUserDuroodCountsCount(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateUserDuroodCount(UserDuroodCountModel data, String id) async {
    // Changing Collection Path
    _api.changePath(AppConst.userCollection);
    await _api.updateDocument(data.toJson(), id);
    print('User Updated Successfully.');
    return;
  }

  Future addUserDuroodCount(UserDuroodCountModel data) async {
    // Changing Collection Path
    _api.changePath(AppConst.userCollection);
    var result = await _api.addDocument(data.toJson());
    print(result);
    print('User Added Successfully.');
    return;
  }

  Future<String> addCustomUserDuroodCount(
      BuildContext context, Map<String, dynamic> data) async {
    // Changing Collection Path
    _api.changePath(AppConst.userDuroodCountCollection);

    // print('Got Data');
    // print(data['CountData']);

    // Making Data
    // Making Temporary Objects
    UserDuroodCountModel mapObject = new UserDuroodCountModel();
    // UserMonthlyData
    mapObject.CountData = {
      data['CountData'].keys.elementAt(0).toString(): {
        data['CountData'].values.elementAt(0).keys.elementAt(0).toString(): {
          data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .keys
                  .elementAt(0)
                  .toString():
              data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0),
          data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .keys
                  .elementAt(1)
                  .toString():
              data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(1),
          data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .keys
                  .elementAt(2)
                  .toString():
              data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(2),
          data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .keys
                  .elementAt(3)
                  .toString():
              data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(3),
          data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .keys
                  .elementAt(4)
                  .toString():
              data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(4),
          data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .keys
                  .elementAt(5)
                  .toString():
              data['CountData']
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(0)
                  .values
                  .elementAt(5),
        }
      }
    };
    // print('Made Data');
    // print(mapObject.toJson());

    // Getting Data
    await _api.addCustomDocument(mapObject.toJson(), data['UserId']);
    // print(result);
    return 'DuroodCount Added Successfully.';
  }
}
