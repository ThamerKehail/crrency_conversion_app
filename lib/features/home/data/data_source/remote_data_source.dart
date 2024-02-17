import 'package:currency_converter_app/features/home/data/model/convert.dart';
import 'package:currency_converter_app/features/home/data/model/hisrorical.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../../core/utils/api_service/api_service.dart';
import '../../domain/entities/country.dart';
import '../model/currency.dart';

abstract class HomeRemoteDataSource {
  Future<List<CurrencyEntity>> fetchCountry();
  Future<ConvertModel> convertCurrency(
      {required String fromCurrency,
      required String toCurrency,
      required double amount});
  Future<List<HistoricalModel>> fetchHistorical(
      {required String date, required String from, required String to});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;
  final http.Client? client;
  HomeRemoteDataSourceImp(this.apiService, {this.client});
  @override
  Future<List<CurrencyModel>> fetchCountry() async {
    var data = await apiService.get(
        endPoint: "currencies?api_key=f3b5f05a3e-b485ad8d61-s8y70m");

    List<CurrencyModel> currencies = [];
    data['currencies'].forEach((code, name) {
      // print(key);
      currencies.add(CurrencyModel.fromJson({
        'code': code,
        'name': name,
      }));
    });
    print(data);
    print(currencies[0].code);
    print(currencies[0].name);
    var box = Hive.box<CurrencyEntity>("currency");
    box.addAll(currencies);

    return currencies;
  }

  @override
  Future<ConvertModel> convertCurrency(
      {required String fromCurrency,
      required String toCurrency,
      required double amount}) async {
    var data = await apiService.get(
        endPoint:
            "convert?from=$fromCurrency&to=$toCurrency&amount=$amount&api_key=f3b5f05a3e-b485ad8d61-s8y70m");
    ConvertModel convertModel = ConvertModel.fromJson(data, toCurrency);

    return convertModel;
  }

  @override
  Future<List<HistoricalModel>> fetchHistorical(
      {required String date, required String from, required String to}) async {
    var data = await apiService.get(
        endPoint:
            "historical?date=$date&from=$from&to=$to&api_key=f3b5f05a3e-b485ad8d61-s8y70m");

    List<HistoricalModel> historical = [];
    data['results'].forEach((currencyCode, rate) {
      // print(key);
      historical.add(HistoricalModel.fromJson({
        'currencyCode': currencyCode,
        'rate': rate,
      }));
    });

    return historical;
  }
}
