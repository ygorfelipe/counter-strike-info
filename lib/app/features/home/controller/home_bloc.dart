import 'package:cs2_info/app/application/logger/i_logger.dart';
import 'package:cs2_info/app/features/home/controller/home_state.dart';
import 'package:cs2_info/app/repositories/agent/agent_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  final AgentRepository _repository;
  final ILogger _logger;

  HomeBloc(this._repository, this._logger) : super(HomeState.initial());

  Future<void> loadAgents() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final agents = await _repository.getAllAgent();
      emit(state.copyWith(status: HomeStatus.loaded, agents: agents));
    } catch (e, s) {
      _logger.error('Erro ao buscar listas de agents', e, s);
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Erro ao buscar listas de agents',
      ));
    }
  }
}
