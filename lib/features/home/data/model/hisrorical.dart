class HistoricalModel {
  final String currencyCode;
  final num rate;

  HistoricalModel({
    required this.currencyCode,
    required this.rate,
  });

  factory HistoricalModel.fromJson(Map<String, dynamic> json) {
    return HistoricalModel(
      currencyCode: json['currencyCode'],
      rate: json['rate'],
    );
  }
}
