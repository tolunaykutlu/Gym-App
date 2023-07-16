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
}
