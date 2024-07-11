// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension AgentStatusMatch on AgentStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == AgentStatus.initial) {
      return initial();
    }

    if (v == AgentStatus.loading) {
      return loading();
    }

    if (v == AgentStatus.loaded) {
      return loaded();
    }

    if (v == AgentStatus.error) {
      return error();
    }

    throw Exception('AgentStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == AgentStatus.initial && initial != null) {
      return initial();
    }

    if (v == AgentStatus.loading && loading != null) {
      return loading();
    }

    if (v == AgentStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == AgentStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
