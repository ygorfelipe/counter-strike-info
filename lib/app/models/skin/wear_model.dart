import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WearModel {
  final String? id;
  final String? name;
  WearModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory WearModel.fromMap(Map<String, dynamic> map) {
    return WearModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WearModel.fromJson(String source) =>
      WearModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WearModel{id=$id, name=$name}';
  }
}
