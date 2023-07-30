import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? name;
  String? gender;
  String? email;
  int? age;
  int? weight;
  int? height;
  String? bmiScore;
  String userId;
  UserModel({
    this.name,
    this.gender,
    this.email,
    this.age,
    this.weight,
    this.height,
    this.bmiScore,
    required this.userId,
  });
// new fields are going to be added.

  UserModel copyWith({
    String? name,
    String? gender,
    String? email,
    int? age,
    int? weight,
    int? height,
    String? bmiScore,
    String? userId,
  }) {
    return UserModel(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bmiScore: bmiScore ?? this.bmiScore,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'email': email,
      'age': age,
      'weight': weight,
      'height': height,
      'bmiScore': bmiScore,
      'userId': userId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      bmiScore: map['bmiScore'] != null ? map['bmiScore'] as String : null,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, gender: $gender, email: $email, age: $age, weight: $weight, height: $height, bmiScore: $bmiScore, userId: $userId)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.gender == gender &&
        other.email == email &&
        other.age == age &&
        other.weight == weight &&
        other.height == height &&
        other.bmiScore == bmiScore &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        gender.hashCode ^
        email.hashCode ^
        age.hashCode ^
        weight.hashCode ^
        height.hashCode ^
        bmiScore.hashCode ^
        userId.hashCode;
  }
}
