// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:cs2_info/app/models/agent/agent_model.dart';

part 'agent_state.g.dart';

@match
enum AgentStatus {
  initial,
  loading,
  loaded,
  error,
}

class AgentState extends Equatable {
  final AgentStatus status;
  final String? errorMessage;
  final List<AgentModel> agents;
  const AgentState({
    required this.status,
    this.errorMessage,
    required this.agents,
  });

  AgentState.initial()
      : status = AgentStatus.initial,
        agents = [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, errorMessage, agents];

  AgentState copyWith({
    AgentStatus? status,
    String? errorMessage,
    List<AgentModel>? agents,
    List<AgentModel>? searchAgents,
  }) {
    return AgentState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      agents: agents ?? this.agents,
    );
  }
}
