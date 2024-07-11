// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:cs2_info/app/models/agent/agent_model.dart';

part 'home_state.g.dart';

@match
enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String? errorMessage;
  final List<AgentModel> agents;

  const HomeState({
    required this.status,
    this.errorMessage,
    required this.agents,
  });

  HomeState.initial()
      : status = HomeStatus.initial,
        agents = [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, errorMessage, agents];

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    List<AgentModel>? agents,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      agents: agents ?? this.agents,
    );
  }
}
