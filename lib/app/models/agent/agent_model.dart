// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../model_generic/collections_model.dart';
import '../model_generic/rarity_model.dart';
import '../model_generic/team_model.dart';

class AgentModel {
  final String id;
  final String name;
  final String description;
  final RarityModel rarity;
  final List<CollectionsModel> collections;
  final TeamModel teamModel;
  final String marketHashName;
  final String image;
  AgentModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rarity,
    required this.collections,
    required this.teamModel,
    required this.marketHashName,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'rarity': rarity.toMap(),
      'collections': collections.map((x) => x.toMap()).toList(),
      'team': teamModel.toMap(),
      'market_hash_name': marketHashName,
      'image': image,
    };
  }

  factory AgentModel.fromMap(Map<String, dynamic> map) {
    return AgentModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      rarity: RarityModel.fromMap(map['rarity'] as Map<String, dynamic>),
      collections: map['collections']
              ?.map<CollectionsModel>((x) => CollectionsModel.fromMap(x))
              .toList() ??
          <CollectionsModel>[],
      teamModel: TeamModel.fromMap(map['team'] as Map<String, dynamic>),
      marketHashName: map['market_hash_name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgentModel.fromJson(String source) =>
      AgentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AgentModel{id=$id, name=$name, description=$description, rarity=$rarity, collections=$collections, teamModel=$teamModel, market_hash_name=$marketHashName, image=$image}';
  }
}
