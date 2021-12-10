class UserDuroodCountModel {
  String Uid = '';
  Map<String, dynamic> CountData = {};

  UserDuroodCountModel({
    this.CountData,
  });

  UserDuroodCountModel.fromMap(Map snapshot, String uid)
      : this.Uid = uid,
        CountData = snapshot['CountData'] ?? {};

  toJson() {
    return {
      "CountData": CountData,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "CountData": CountData,
    };
  }
}
