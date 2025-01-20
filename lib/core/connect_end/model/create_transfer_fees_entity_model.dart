class CreateTransferFeesEntityModel {
  String? currency;
  String? fee;

  CreateTransferFeesEntityModel({this.currency, this.fee});

  factory CreateTransferFeesEntityModel.fromJson(Map<String, dynamic> json) {
    return CreateTransferFeesEntityModel(
      currency: json['currency']?.toString(),
      fee: json['fee']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (currency != null) 'currency': currency,
        if (fee != null) 'fee': fee,
      };
}
