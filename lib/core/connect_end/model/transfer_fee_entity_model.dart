class TransferFeeEntityModel {
  String? currency;
  String? fee;

  TransferFeeEntityModel({this.currency, this.fee});

  factory TransferFeeEntityModel.fromJson(Map<String, dynamic> json) {
    return TransferFeeEntityModel(
      currency: json['currency']?.toString(),
      fee: json['fee']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (currency != null) 'currency': currency,
        if (fee != null) 'fee': fee,
      };
}
