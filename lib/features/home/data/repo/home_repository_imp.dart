import 'package:currency_converter_app/core/errors/failure.dart';
import 'package:currency_converter_app/features/home/data/data_source/local_data_source.dart';
import 'package:currency_converter_app/features/home/data/model/hisrorical.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/country.dart';
import '../../domain/repo/home_repository.dart';
import '../data_source/remote_data_source.dart';
import '../model/convert.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImp(this.homeRemoteDataSource, this.homeLocalDataSource);

  @override
  Future<Either<Failure, List<CurrencyEntity>>> fetchCountries() async {
    try {
      var currency = homeLocalDataSource.fetchCurrency();
      if (currency.isNotEmpty) {
        return Right(currency);
      }
      List<CurrencyEntity> countries =
          await homeRemoteDataSource.fetchCountry();
      return Right(countries);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ConvertModel>> convertCurrency(
      {required String fromCurrency,
      required String toCurrency,
      required double amount}) async {
    try {
      ConvertModel result = await homeRemoteDataSource.convertCurrency(
          fromCurrency: fromCurrency, toCurrency: toCurrency, amount: amount);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HistoricalModel>>> fetchHistorical(
      {required String date, required String from, required String to}) async {
    try {
      List<HistoricalModel> result = await homeRemoteDataSource.fetchHistorical(
          date: date, from: from, to: to);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
