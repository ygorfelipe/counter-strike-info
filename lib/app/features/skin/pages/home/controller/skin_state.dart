// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../../../../models/skin/skin_model.dart';

part 'skin_state.g.dart';

@match
enum SkinStatus {
  initial,
  loading,
  loaded,
  error,
  search,
}

class SkinState extends Equatable {
  final SkinStatus status;
  final String? errorMessage;
  final List<SkinModel> skins;
  final bool? choiceChip;
  const SkinState({
    required this.status,
    this.errorMessage,
    required this.skins,
    this.choiceChip,
  });

  SkinState.initial()
      : status = SkinStatus.initial,
        skins = [],
        choiceChip = false,
        errorMessage = null;

  @override
  List<Object?> get props => [status, errorMessage, skins, choiceChip];

  SkinState copyWith({
    SkinStatus? status,
    String? errorMessage,
    List<SkinModel>? skins,
    bool? choiceChip,
  }) {
    return SkinState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      skins: skins ?? this.skins,
      choiceChip: choiceChip ?? this.choiceChip,
    );
  }
}
