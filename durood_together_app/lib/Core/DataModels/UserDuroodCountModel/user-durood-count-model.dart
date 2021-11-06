class UserDuroodCountModel {
  Map<String, dynamic> CountData = {};

  UserDuroodCountModel({
    this.CountData,
  });

  UserDuroodCountModel.fromMap(Map snapshot)
      : CountData = snapshot['CountData'] ?? '';

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
