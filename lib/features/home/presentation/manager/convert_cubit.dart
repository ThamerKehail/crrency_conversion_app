import 'package:currency_converter_app/features/home/data/model/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/home_use_case.dart';

part 'convert_state.dart';

class ConvertCubit extends Cubit<ConvertState> {
  final FetchHomeUseCase fetchHomeUseCase;
  ConvertCubit(this.fetchHomeUseCase) : super(ConvertInitial());
  Future<void> convertCurrency() async {
    emit(ConvertLoadingState());
    var result = await fetchHomeUseCase.convertCurrency(
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
      amount: double.parse(textEditingController.text),
    );
    result.fold((failure) {
      emit(ConvertFailureState(failure.message));
    }, (result) async {
      emit(ConvertSuccessState(result));
    });
  }

  init() {
    print("object");
  }

  String fromCurrency = 'JOD';
  String toCurrency = 'USD';
  double amount = 5;
  final TextEditingController textEditingController =
      TextEditingController(text: '5');
}
