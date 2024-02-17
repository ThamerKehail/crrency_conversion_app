class ConvertModel {
  String? base;
  int? amount;
  Result? result;
  int? ms;

  ConvertModel({
    this.base,
    this.amount,
    this.result,
    this.ms,
  });

  ConvertModel.fromJson(Map<String, dynamic> json, String priceType) {
    base = json['base'];
    amount = json['amount'];
    result = json['result'] != null
        ? Result.fromJson(json['result'], priceType)
        : null;
    ms = json['ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['amount'] = this.amount;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['ms'] = this.ms;
    return data;
  }
}

class Result {
  num? type;
  double? rate;

  Result({this.type, this.rate});

  Result.fromJson(Map<String, dynamic> json, String priceType) {
    type = json[priceType];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JOD'] = this.type;
    data['rate'] = this.rate;
    return data;
  }
}
