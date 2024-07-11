// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CollectionsModel {
  final String? id;
  final String? name;
  final String? image;
  CollectionsModel({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CollectionsModel.fromMap(Map<String, dynamic> map) {
    return CollectionsModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionsModel.fromJson(String source) =>
      CollectionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CollectionsModel{id=$id, name=$name, image=$image}';
  }
}
