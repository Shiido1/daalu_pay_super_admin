class SendBroadcastEntityModel {
  String? message;
  String? title;

  SendBroadcastEntityModel({this.message, this.title});

  factory SendBroadcastEntityModel.fromJson(Map<String, dynamic> json) {
    return SendBroadcastEntityModel(
      message: json['message']?.toString(),
      title: json['title']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (message != null) 'message': message,
        if (title != null) 'title': title,
      };
}
