import 'package:currency_converter_app/features/home/domain/use_cases/home_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/country.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final FetchHomeUseCase fetchHomeUseCase;
  CountryCubit(this.fetchHomeUseCase) : super(CountryInitial());
  Future<void> fetchCountry() async {
    emit(CountryFetchLoadingState());
    var result = await fetchHomeUseCase.fetchCountries();
    result.fold((failure) {
      emit(CountryFetchFailureState(failure.message));
    }, (countries) async {
      print(countries.length);
      emit(CountryFetchSuccessState(countries));
    });
  }
}
