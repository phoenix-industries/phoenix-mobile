class Chatsummery {
  final String id;
  final String title;
  final String type;

  final String lastMessage;
  final String lastMessageUserId;
  final String lastMessageUserName;
  final DateTime? lastMessageTime;

  Chatsummery({
    required this.id,
    required this.title,
    required this.type,
    required this.lastMessage,
    required this.lastMessageUserId,
    required this.lastMessageUserName,
    this.lastMessageTime,
  });

  factory Chatsummery.fromjson(Map<String, dynamic> json) {
    final lastMsg = json['last_message'];

    return Chatsummery(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      type: json['type'] ?? '',

      lastMessage: lastMsg?['content'] ?? '',
      lastMessageUserId: lastMsg?['user_id']?.toString() ?? '',
      lastMessageUserName: lastMsg?['user_name'] ?? '',

      lastMessageTime:
          lastMsg?['created_at'] != null &&
              lastMsg['created_at'].toString().isNotEmpty
          ? DateTime.parse(lastMsg['created_at'])
          : null,
    );
  }
}
