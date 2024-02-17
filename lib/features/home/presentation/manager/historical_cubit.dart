import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/hisrorical.dart';
import '../../domain/use_cases/home_use_case.dart';

part 'historical_state.dart';

class HistoricalCubit extends Cubit<HistoricalState> {
  final FetchHomeUseCase fetchHomeUseCase;
  HistoricalCubit(this.fetchHomeUseCase) : super(HistoricalInitial());
  Future<void> fetchHistorical(
      {required String date, required String from, required String to}) async {
    emit(HistoricalLoadingState());
    var result =
        await fetchHomeUseCase.fetchHistorical(date: date, from: from, to: to);
    result.fold((failure) {
      emit(HistoricalFailureState(failure.message));
    }, (historical) async {
      emit(HistoricalSuccessState(historical));
    });
  }
}
