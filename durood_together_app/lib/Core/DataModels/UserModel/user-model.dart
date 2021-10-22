class UserModel {
  String Country = "";
  String City = "";
  String Email = "";
  String Name = "";

  UserModel({
    this.Country,
    this.City,
    this.Email,
    this.Name,
  });

  UserModel.fromMap(Map snapshot)
      : Country = snapshot['Country'] ?? '',
        City = snapshot['City'] ?? '',
        Email = snapshot['Email'] ?? '',
        Name = snapshot['Name'] ?? '';

  toJson() {
    return {
      "Country": Country,
      "City": City,
      "Email": Email,
      "Name": Name,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "Country": Country,
      "City": City,
      "Email": Email,
      "Name": Name,
    };
  }
}
