class AddExchangeRateEntityModel {
  String? fromCurrency;
  String? toCurrency;
  String? rate;

  AddExchangeRateEntityModel({
    this.fromCurrency,
    this.toCurrency,
    this.rate,
  });

  factory AddExchangeRateEntityModel.fromJson(Map<String, dynamic> json) {
    return AddExchangeRateEntityModel(
      fromCurrency: json['from_currency']?.toString(),
      toCurrency: json['to_currency']?.toString(),
      rate: json['rate']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (fromCurrency != null) 'from_currency': fromCurrency,
        if (toCurrency != null) 'to_currency': toCurrency,
        if (rate != null) 'rate': rate,
      };
}
