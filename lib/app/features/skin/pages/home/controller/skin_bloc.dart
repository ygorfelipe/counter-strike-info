import 'package:cs2_info/app/application/logger/i_logger.dart';
import 'package:cs2_info/app/features/skin/pages/home/controller/skin_state.dart';
import 'package:cs2_info/app/repositories/skin/skin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkinBloc extends Cubit<SkinState> {
  final SkinRepository _repository;
  final ILogger _logger;

  SkinBloc(this._repository, this._logger) : super(SkinState.initial());

  Future<void> loadSkins() async {
    try {
      emit(state.copyWith(status: SkinStatus.loading));
      final skins = await _repository.getAllSkin();
      emit(state.copyWith(status: SkinStatus.loaded, skins: skins));
    } catch (e, s) {
      _logger.error('Erro ao buscar skins', e, s);
      emit(state.copyWith(
          status: SkinStatus.error, errorMessage: 'Erro ao buscar skins'));
    }
  }

  //! FILTRANDO NOME SKINS
  void filterSkin(String name) async {
    final skins = await _repository.getAllSkin();
    if (name.isEmpty) {
      emit(state.copyWith(skins: skins));
    } else {
      //* filtrando os dados
      final filteredList = skins
          .where((skin) =>
              skin.name.toString().toLowerCase().contains(name.toLowerCase()))
          .toList();
      emit(state.copyWith(skins: filteredList));
    }
  }

  //! FILTRANDO A-z
  void filterByAz(String byAz) async {
    final skins = await _repository.getAllSkin();
    if (byAz.contains('a-z')) {
      skins.sort((a, b) => b.name.compareTo(b.name));
      emit(state.copyWith(skins: skins));
    } else {
      skins.sort((a, b) => a.name.compareTo(b.name));
      emit(state.copyWith(skins: skins));
    }
  }

  // //! categoria - OK
  List<String> getCategory() {
    var listCategories = <String>[];
    for (var i in state.skins) {
      final value = i.category?.name;
      if (value != null) {
        listCategories.add(value);
      }
    }
    final unic = listCategories.toSet().toList();
    listCategories = unic;
    return listCategories;
  }

  void filterCategory(String category) async {
    final skins = await _repository.getAllSkin();
    emit(state.copyWith(skins: skins));
    if (category.isEmpty) {
    } else {
      final filterCategory = skins
          .where((skin) => '${skin.category?.name}'
              .toLowerCase()
              .contains(category.toLowerCase()))
          .toList();
      emit(state.copyWith(skins: filterCategory));
    }
  }
}
