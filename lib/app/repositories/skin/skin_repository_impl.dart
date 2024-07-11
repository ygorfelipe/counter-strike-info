import 'package:cs2_info/app/application/constants/constants.dart';
import 'package:cs2_info/app/application/rest_client/custom_dio.dart';
import 'package:cs2_info/app/models/skin/skin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './skin_repository.dart';

class SkinRepositoryImpl implements SkinRepository {
  final CustomDio _dio;

  SkinRepositoryImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<List<SkinModel>> getAllSkin() async {
    final sp = await SharedPreferences.getInstance();
    final language = sp.getString(Constants.language);
    final result = await _dio.unAuht().get('/$language/skins.json');
    return result.data
        .map<SkinModel>((skin) => SkinModel.fromMap(skin))
        .toList();
  }
}
