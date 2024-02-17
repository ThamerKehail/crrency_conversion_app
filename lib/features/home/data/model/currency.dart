import 'package:currency_converter_app/features/home/domain/entities/country.dart';

class CurrencyModel extends CurrencyEntity {
  final String code;
  final String name;

  CurrencyModel({
    required this.code,
    required this.name,
  }) : super(countryName: name, countryCode: code);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['code'],
      name: json['name'],
    );
  }
}
