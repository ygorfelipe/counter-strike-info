// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../../models/country_codes/country_model.dart';

part 'splash_state.g.dart';

@match
enum SplashStatus {
  initial,
  loading,
  loaded,
  success,
  error,
}

class SplashState extends Equatable {
  final SplashStatus status;
  final String? errorMessage;
  final List<CountryModel> countries;

  const SplashState({
    required this.status,
    this.errorMessage,
    required this.countries,
  });

  SplashState.initial()
      : status = SplashStatus.initial,
        countries = [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, errorMessage, countries];

  SplashState copyWith({
    SplashStatus? status,
    String? errorMessage,
    List<CountryModel>? countries,
  }) {
    return SplashState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      countries: countries ?? this.countries,
    );
  }
}
