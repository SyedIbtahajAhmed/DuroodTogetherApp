class DuroodCount {
  String Date = "";

  Map<String, dynamic> CityData = {};
  Map<String, dynamic> CountryData = {};
  Map<String, dynamic> TopFiveCityData = {};
  Map<String, dynamic> TopFiveCountryData = {};
  Map<String, dynamic> UserData = {};
  Map<String, dynamic> UserMonthlyData = {};

  DuroodCount({
    this.Date,
    this.CityData,
    this.CountryData,
    this.TopFiveCityData,
    this.TopFiveCountryData,
    this.UserData,
    this.UserMonthlyData,
  });

  DuroodCount.fromMap(Map snapshot, String date)
      : this.Date = date,
        CityData = snapshot['CityData'] ?? '',
        CountryData = snapshot['CountryData'] ?? '',
        TopFiveCityData = snapshot['TopFiveCityData'] ?? '',
        TopFiveCountryData = snapshot['TopFiveCountryData'] ?? '',
        UserData = snapshot['UserData'] ?? '',
        UserMonthlyData = snapshot['UserMonthlyData'] ?? '';

  toJson() {
    return {
      "CityData": CityData,
      "CountryData": CountryData,
      "TopFiveCityData": TopFiveCityData,
      "TopFiveCountryData": TopFiveCountryData,
      "UserData": UserData,
      "UserMonthlyData": UserMonthlyData,
    };
  }
}
