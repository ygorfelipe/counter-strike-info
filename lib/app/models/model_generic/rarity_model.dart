import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class RarityModel {
  final String id;
  final String name;
  final String color;
  RarityModel({
    required this.id,
    required this.name,
    required this.color,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'color': color,
    };
  }

  factory RarityModel.fromMap(Map<String, dynamic> map) {
    return RarityModel(
      id: map['id'] as String,
      name: map['name'] as String,
      color: map['color'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RarityModel.fromJson(String source) => RarityModel.fromMap(json.decode(source) as Map<String, dynamic>);

@override
String toString() {
    return 'RarityModel{id=$id, name=$name, color=$color}';
  }
}
