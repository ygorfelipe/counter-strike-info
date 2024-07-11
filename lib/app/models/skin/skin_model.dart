// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cs2_info/app/models/model_generic/rarity_model.dart';
import 'package:cs2_info/app/models/model_generic/team_model.dart';

import '../model_generic/collections_model.dart';
import 'category_model.dart';
import 'crate_model.dart';
import 'pattern_model.dart';
import 'weapon_model.dart';
import 'wear_model.dart';

class SkinModel {
  final String? id;
  final String name;
  final String? description;
  final WeaponModel? weapon;
  final CategoryModel? category;
  final PatternModel? pattern;
  final num? minFloat;
  final num? maxFloat;
  final RarityModel? rarity;
  final bool? stattrak;
  final bool? souvenir;
  final List<WearModel>? wears;
  final List<CollectionsModel>? collections;
  final List<CrateModel>? crates;
  final TeamModel? team;
  final String? image;
  SkinModel({
    required this.id,
    required this.name,
    required this.description,
    required this.weapon,
    required this.category,
    required this.pattern,
    required this.minFloat,
    required this.maxFloat,
    required this.rarity,
    required this.stattrak,
    required this.souvenir,
    required this.wears,
    required this.collections,
    required this.crates,
    required this.team,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'weapon': weapon?.toMap(),
      'category': category?.toMap(),
      'pattern': pattern?.toMap(),
      'minFloat': minFloat,
      'maxFloat': maxFloat,
      'rarity': rarity?.toMap(),
      'stattrak': stattrak,
      'souvenir': souvenir,
      'wears': wears?.map((x) => x.toMap()).toList(),
      'collections': collections?.map((x) => x.toMap()).toList(),
      'crates': crates?.map((x) => x.toMap()).toList(),
      'team': team?.toMap(),
      'image': image,
    };
  }

  factory SkinModel.fromMap(Map<String, dynamic> map) {
    return SkinModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      weapon: WeaponModel.fromMap(map['weapon'] as Map<String, dynamic>),
      category: CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      pattern:
          map['pattern'] != null ? PatternModel.fromMap(map['pattern']) : null,
      minFloat: map['min_float'] != null ? map['min_float'] as num : null,
      maxFloat: map['max_float'] != null ? map['max_float'] as num : null,
      rarity: RarityModel.fromMap(map['rarity'] as Map<String, dynamic>),
      stattrak: map['stattrak'] as bool,
      souvenir: map['souvenir'] != null ? map['souvenir'] as bool : null,
      // wears: map['wears']?.map<WearModel>((x) => WearModel.fromMap(x)).toList(),
      wears: map['wears'] != null
          ? (map['wears'] as List).map((x) => WearModel.fromMap(x)).toList()
          : null,
      collections: map['collections'] != null
          ? (map['collections'] as List)
              .map((x) => CollectionsModel.fromMap(x))
              .toList()
          : null,
      crates: map['crates'] != null
          ? (map['crates'] as List).map((x) => CrateModel.fromMap(x)).toList()
          : null,
      // crates: map['crates']
      //         ?.map<CrateModel>((x) => CrateModel.fromMap(x))
      //         .toList() ??
      //     <CrateModel>[],
      team: TeamModel.fromMap(map['team'] as Map<String, dynamic>),
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SkinModel.fromJson(String source) =>
      SkinModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SkinModel{id=$id, name=$name, description=$description, weapon=$weapon, category=$category, pattern=$pattern, min_float=$minFloat, max_float=$maxFloat, rarity=$rarity, stattrak=$stattrak, souvenir=$souvenir, wears=$wears, collections=$collections, crates=$crates, team=$team, image=$image}';
  }
}
