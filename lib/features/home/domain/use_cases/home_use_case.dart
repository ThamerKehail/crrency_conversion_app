import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/convert.dart';
import '../../data/model/hisrorical.dart';
import '../entities/country.dart';
import '../repo/home_repository.dart';

class FetchHomeUseCase {
  final HomeRepository homeRepo;

  FetchHomeUseCase(this.homeRepo);

  Future<Either<Failure, List<CurrencyEntity>>> fetchCountries() {
    return homeRepo.fetchCountries();
  }

  Future<Either<Failure, ConvertModel>> convertCurrency(
      {required String fromCurrency,
      required String toCurrency,
      required double amount}) {
    return homeRepo.convertCurrency(
        fromCurrency: fromCurrency, toCurrency: toCurrency, amount: amount);
  }

  Future<Either<Failure, List<HistoricalModel>>> fetchHistorical(
      {required String date, required String from, required String to}) {
    return homeRepo.fetchHistorical(date: date, from: from, to: to);
  }
}
