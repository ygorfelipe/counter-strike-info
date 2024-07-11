// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skin_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension SkinStatusMatch on SkinStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() search}) {
    final v = this;
    if (v == SkinStatus.initial) {
      return initial();
    }

    if (v == SkinStatus.loading) {
      return loading();
    }

    if (v == SkinStatus.loaded) {
      return loaded();
    }

    if (v == SkinStatus.error) {
      return error();
    }

    if (v == SkinStatus.search) {
      return search();
    }

    throw Exception('SkinStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error,
      T Function()? search}) {
    final v = this;
    if (v == SkinStatus.initial && initial != null) {
      return initial();
    }

    if (v == SkinStatus.loading && loading != null) {
      return loading();
    }

    if (v == SkinStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == SkinStatus.error && error != null) {
      return error();
    }

    if (v == SkinStatus.search && search != null) {
      return search();
    }

    return any();
  }
}
