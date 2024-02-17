import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/convert.dart';
import '../../data/model/hisrorical.dart';
import '../entities/country.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CurrencyEntity>>> fetchCountries();
  Future<Either<Failure, ConvertModel>> convertCurrency(
      {required String fromCurrency,
      required String toCurrency,
      required double amount});
  Future<Either<Failure, List<HistoricalModel>>> fetchHistorical(
      {required String date, required String from, required String to});
}
