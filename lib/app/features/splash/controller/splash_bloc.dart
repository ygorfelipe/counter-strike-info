import 'package:cs2_info/app/application/logger/i_logger.dart';
import 'package:cs2_info/app/features/splash/controller/splash_state.dart';
import 'package:cs2_info/app/repositories/country_code/country_code_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Cubit<SplashState> {
  final CountryCodeRepository _repository;
  final ILogger _logger;
  SplashBloc(this._repository, this._logger) : super(SplashState.initial());

  Future<void> loadContries() async {
    try {
      emit(state.copyWith(status: SplashStatus.loading));
      final countires = await _repository.getAll();
      countires.sort((a, b) => a.name.compareTo(b.name));
      emit(state.copyWith(countries: countires, status: SplashStatus.loaded));
    } catch (e, s) {
      _logger.error('Erro ao buscar lista de paises', e, s);
      emit(state.copyWith(
          status: SplashStatus.error,
          errorMessage: 'Erro ao buscar lista de paises'));
    }
  }
}
