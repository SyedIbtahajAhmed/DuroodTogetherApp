class DuroodCount {
  String Date = "";

  Map<String, dynamic> CityData = {};
  Map<String, dynamic> CountryData = {};
  Map<String, dynamic> TopFiveCityData = {};
  Map<String, dynamic> TopFiveCountryData = {};
  Map<String, dynamic> UserData = {};
  Map<String, dynamic> UserMonthlyData = {};
  Map<String, dynamic> UserWeeklyData = {};

  DuroodCount({
    this.Date,
    this.CityData,
    this.CountryData,
    this.TopFiveCityData,
    this.TopFiveCountryData,
    this.UserData,
    this.UserMonthlyData,
    this.UserWeeklyData,
  });

  DuroodCount.fromMap(Map snapshot, String date)
      : this.Date = date,
        CityData = snapshot['CityData'] ?? '',
        CountryData = snapshot['CountryData'] ?? '',
        TopFiveCityData = snapshot['TopFiveCityData'] ?? '',
        TopFiveCountryData = snapshot['TopFiveCountryData'] ?? '',
        UserData = snapshot['UserData'] ?? '',
        UserMonthlyData = snapshot['UserMonthlyData'] ?? '',
        UserWeeklyData = snapshot['UserWeeklyData'] ?? '';

  toJson() {
    return {
      "CityData": CityData,
      "CountryData": CountryData,
      "TopFiveCityData": TopFiveCityData,
      "TopFiveCountryData": TopFiveCountryData,
      "UserData": UserData,
      "UserMonthlyData": UserMonthlyData,
      "UserWeeklyData": UserWeeklyData,
    };
  }
}
