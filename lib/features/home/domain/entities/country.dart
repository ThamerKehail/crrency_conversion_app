import 'package:hive/hive.dart';

part 'country.g.dart';

@HiveType(typeId: 0)
class CurrencyEntity {
  @HiveField(0)
  final String countryName;
  @HiveField(1)
  final String countryCode;

  CurrencyEntity({required this.countryName, required this.countryCode});
}
