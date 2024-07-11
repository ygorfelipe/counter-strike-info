import 'package:cs2_info/app/models/skin/skin_model.dart';

sealed class GetItemName {
  static String? getItemName(SkinModel skin) {
    if (skin.crates != null && skin.crates!.isNotEmpty) {
      return skin.crates!.first.name;
    }
    return 'https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg';
  }
}
