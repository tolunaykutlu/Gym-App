class UserModel {
  String? name;
  String? gender;
  int? age;
  int? weight;
  int? height;
// new fields are going to be added.
  UserModel(
      {required this.name,
      required this.age,
      required this.weight,
      required this.height,
      required this.gender});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    gender = json["gender"];
    age = json["age"];
    weight = json["weight"];
    height = json["height"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["gender"] = gender;
    data["age"] = age;
    data["weight"] = weight;
    data["height"] = height;
    return data;
  }
}
