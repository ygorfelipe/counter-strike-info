import 'package:cs2_info/app/application/logger/i_logger.dart';
import 'package:cs2_info/app/features/agent/pages/home/controller/agent_state.dart';
import 'package:cs2_info/app/repositories/agent/agent_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgentBloc extends Cubit<AgentState> {
  final AgentRepository _repository;
  final ILogger _logger;

  AgentBloc(this._repository, this._logger) : super(AgentState.initial());

  Future<void> loadAgents() async {
    try {
      emit(state.copyWith(status: AgentStatus.loading));
      final agents = await _repository.getAllAgent();
      emit(state.copyWith(status: AgentStatus.loaded, agents: agents));
    } catch (e, s) {
      _logger.error('Erro ao buscar agents', e, s);
      emit(state.copyWith(
        status: AgentStatus.error,
        errorMessage: 'Erro ao buscar agents',
      ));
    }
  }

  void filterAgent(String name) async {
    final agents = await _repository.getAllAgent();
    if (name.isEmpty) {
      emit(state.copyWith(agents: agents));
    }
    final filteredList = agents
        .where((agent) =>
            agent.name.toString().toLowerCase().contains(name.toLowerCase()))
        .toList();
    emit(state.copyWith(agents: filteredList));
  }

  void filterByAz(String byAz) async {
    final agents = await _repository.getAllAgent();
    if (byAz.contains('a-Z')) {
      agents.sort((a, b) => a.name.compareTo(b.name));
      emit(state.copyWith(agents: agents));
    } else {
      agents.sort((a, b) => b.name.compareTo(a.name));
      emit(state.copyWith(agents: agents));
    }
  }
}
