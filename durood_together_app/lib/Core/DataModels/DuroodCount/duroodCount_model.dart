class DuroodCount {
  String Date = "";

  Map<String, dynamic> CityData = {};
  Map<String, dynamic> CountryData = {};
  Map<String, dynamic> UserData = {};
  Map<String, dynamic> UserMonthlyData = {};

  DuroodCount({
    this.Date,
    this.CityData,
    this.CountryData,
    this.UserData,
    this.UserMonthlyData,
  });

  DuroodCount.fromMap(Map snapshot, String date)
      : this.Date = date,
        CityData = snapshot['CityData'] ?? '',
        CountryData = snapshot['CountryData'] ?? '',
        UserData = snapshot['UserData'] ?? '',
        UserMonthlyData = snapshot['UserMonthlyData'] ?? '';

  toJson() {
    return {
      "CityData": CityData,
      "CountryData": CountryData,
      "UserData": UserData,
      "UserMonthlyData": UserMonthlyData,
    };
  }
}
