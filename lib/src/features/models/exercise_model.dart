// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Exercises {
  String name;
  String? description;
  String? difficulty;

  Exercises({
    required this.name,
    this.description,
    this.difficulty,
  });

  Exercises copyWith({
    String? name,
    String? description,
    String? difficulty,
  }) {
    return Exercises(
      name: name ?? this.name,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'difficulty': difficulty,
    };
  }

  factory Exercises.fromMap(Map<String, dynamic> map) {
    return Exercises(
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      difficulty:
          map['difficulty'] != null ? map['difficulty'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exercises.fromJson(String source) =>
      Exercises.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Exercises(name: $name, description: $description, difficulty: $difficulty)';

  @override
  bool operator ==(covariant Exercises other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.difficulty == difficulty;
  }

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ difficulty.hashCode;
}
