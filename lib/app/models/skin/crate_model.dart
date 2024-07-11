// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CrateModel {
  final String? id;
  final String? name;
  final String? image;
  CrateModel({
    this.id,
    this.name,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CrateModel.fromMap(Map<String, dynamic> map) {
    return CrateModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CrateModel.fromJson(String source) =>
      CrateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CrateModel{id=$id, name=$name, image=$image}';
  }
}
