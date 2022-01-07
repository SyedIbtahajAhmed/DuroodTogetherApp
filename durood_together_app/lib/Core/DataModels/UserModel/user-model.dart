class UserModel {
  String userId = "";
  String country = "";
  String city = "";
  String email = "";
  String name = "";

  UserModel({
    this.country,
    this.city,
    this.email,
    this.name,
  });

  UserModel.fromMap(Map snapshot, String id)
      : this.userId = id,
        country = snapshot['country'] ?? '',
        city = snapshot['city'] ?? '',
        email = snapshot['email'] ?? '',
        name = snapshot['name'] ?? '';

  toJson() {
    return {
      "UserId": userId,
      "Country": country,
      "City": city,
      "Email": email,
      "Name": name,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "UserId": userId,
      "Country": country,
      "City": city,
      "Email": email,
      "Name": name,
    };
  }
}
