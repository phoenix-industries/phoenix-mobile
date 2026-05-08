class Chatsummery {
  final int chatId;
  final int userId;
  final String name;
  final String lastmessagel;
  final String time;
  final String? image;
  Chatsummery({
    required this.chatId,
    required this.userId,
    required this.name,
    required this.lastmessagel,
    required this.time,
    this.image,
  });
  factory Chatsummery.fromjson(Map<String, dynamic> json) {
    return Chatsummery(
      chatId: json['chatId'] ?? 0,
      userId: json['userId'] ?? 0,
      name: json['name'] ?? 'unknown',
      lastmessagel: json['lastmessage'] ?? 'unknown',
      time: json['time'] ?? 'unknow',
      image: json['image'] ,
    );
  }
}
