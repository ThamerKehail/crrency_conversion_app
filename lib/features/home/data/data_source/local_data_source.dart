import 'package:hive/hive.dart';

import '../../domain/entities/country.dart';

abstract class HomeLocalDataSource {
  List<CurrencyEntity> fetchCurrency();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<CurrencyEntity> fetchCurrency() {
    var box = Hive.box<CurrencyEntity>("currency");
    return box.values.toList();
  }
}
