class TempModel {
  Map<String, dynamic> Generic = {};

  TempModel({
    this.Generic,
  });

  TempModel.fromMap(Map snapshot, String date)
      : Generic = snapshot['CityData'] ?? '';

  toJson() {
    return {
      "CityData": Generic,
    };
  }
}
