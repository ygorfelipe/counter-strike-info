import '../../models/skin/skin_model.dart';

abstract interface class SkinRepository {
Future<List<SkinModel>> getAllSkin();
}