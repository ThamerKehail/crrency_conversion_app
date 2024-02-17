part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryFetchLoadingState extends CountryState {}

class CountryFetchFailureState extends CountryState {
  final String message;

  CountryFetchFailureState(this.message);
}

class CountryFetchSuccessState extends CountryState {
  final List<CurrencyEntity> countries;

  CountryFetchSuccessState(this.countries);
}
