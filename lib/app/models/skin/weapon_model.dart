// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeaponModel {
  final String? id;
  final String? name;

  WeaponModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory WeaponModel.fromMap(Map<String, dynamic> map) {
    return WeaponModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponModel.fromJson(String source) =>
      WeaponModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeaponModel{id=$id, name=$name}';
  }
}
