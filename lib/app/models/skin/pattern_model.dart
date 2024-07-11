import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PatternModel {
  final String? id;
  final String? name;
  PatternModel({
    required this.id,
    required this.name,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory PatternModel.fromMap(Map<String, dynamic> map) {
    return PatternModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatternModel.fromJson(String source) => PatternModel.fromMap(json.decode(source) as Map<String, dynamic>);

@override
String toString() {
    return 'PatternModel{id=$id, name=$name}';
  }
}
