import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durood_together_app/Core/DataModels/DuroodCount/duroodCount_model.dart';
import 'package:durood_together_app/Core/DataModels/UserModel/user-model.dart';
import 'package:durood_together_app/Core/DataServices/API/appConst.dart';
import 'package:durood_together_app/Core/DataServices/API/generic_api.dart';
import 'package:durood_together_app/Shared/Locator/lcoator.dart';

class UserViewModel {
  Api _api = locator<Api>();

  List<UserModel> users;

  Future<dynamic> fetchDuroodCounts() async {
    var result = await _api.getDataCollection();
    List<DuroodCount> items = [];
    users = result.docs.map((doc) {
      if (doc.id != null) {
        var temp = DuroodCount.fromMap(doc.data(), doc.id.toString());
        items.add(temp);
      }
    }).toList();
    return items;
  }

  Stream<QuerySnapshot> fetchUsersAsStream() {
    return _api.streamDataCollection();
  }

  Future<DuroodCount> getUsersCountById(String id) async {
    var doc = await _api.getDocumentById(id);
    // return DuroodCount.fromMap(doc.data());
    return null;
  }

  Future removeUsersCount(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateUser(UserModel data, String id) async {
    // Changing Collection Path
    _api.changePath(AppConst.userCollection);
    await _api.updateDocument(data.toJson(), id);
    print('User Updated Successfully.');
    return;
  }

  Future addUser(UserModel data) async {
    // Changing Collection Path
    _api.changePath(AppConst.userCollection);
    var result = await _api.addDocument(data.toJson());
    print(result);
    print('User Added Successfully.');
    return;
  }

  Future addCustomUser(UserModel data, String uid) async {
    // Changing Collection Path
    _api.changePath(AppConst.userCollection);
    await _api.addCustomDocument(data.toJson(), uid);
    // print(result);
    print('User Added Successfully At ' + uid);
    return;
  }
}
