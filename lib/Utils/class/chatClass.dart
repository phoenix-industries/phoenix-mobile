class Chatclass {
  final int ChatId;
  final int massageId;
  final int senderId;
  final int reseverId;
  final String text;
  final DateTime timenow;

  Chatclass({
    required this.ChatId,
    required this.reseverId,
    required this.senderId,
    required this.massageId,
    required this.text,
    required this.timenow,
  });
  factory Chatclass.fromJson(Map<String, dynamic> json) {
    return Chatclass(
      massageId: json['massageId'],
      ChatId: json['chatId'] ?? 0,
      senderId: json['senderId'] ?? 0,
      reseverId: json['reseverId'] ?? 0,
      text: json['text'] ?? '',
      timenow: json['time'] != null
          ? DateTime.parse(json['time'])
          : DateTime.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'senderId': senderId,
      'reseverId': reseverId,
      'time': timenow.toIso8601String(),
    };
  }
}
