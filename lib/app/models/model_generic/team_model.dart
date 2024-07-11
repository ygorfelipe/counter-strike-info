// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeamModel {
  final String? id;
  final String? name;

  TeamModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source) =>
      TeamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeamModel{id=$id, name=$name}';
  }
}
