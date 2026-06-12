enum ChatMessageType {
  text,
  file,
  image,
  audio,
  video;

  String toJson() => name;

  static ChatMessageType fromJson(String json) {
    return values.firstWhere(
      (e) => e.name == json,
      orElse: () => throw ArgumentError('Invalid ChatMessageType: $json'),
    );
  }
}

enum MessageType {
  chat,
  system,
  history;

  String toJson() => name;

  static MessageType fromJson(String json) {
    return values.firstWhere(
      (e) => e.name == json,
      orElse: () => throw ArgumentError('Invalid MessageType: $json'),
    );
  }
}

class Model {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  Model({this.id, this.createdAt, this.updatedAt});

  Model.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      createdAt = json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null;

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}

class ChatMessage extends Model {
  final String roomId;
  final String userId;
  final ChatMessageType type;
  final String content;

  ChatMessage({
    super.id,
    super.createdAt,
    super.updatedAt,
    required this.roomId,
    required this.userId,
    required this.type,
    required this.content,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      roomId: json['room_id'] ?? '',
      userId: json['user_id'] ?? '',
      type: ChatMessageType.fromJson(json['type']),
      content: json['content'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'room_id': roomId,
      'user_id': userId,
      'type': type.toJson(),
      'content': content,
    };
  }
}

class Message {
  final MessageType type;
  final String? error;
  final ChatMessage? data;

  Message({required this.type, this.error, this.data});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      type: MessageType.fromJson(json['type']),
      error: json['error'],
      data: json['data'] != null ? ChatMessage.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      if (error != null) 'error': error,
      if (data != null) 'data': data!.toJson(),
    };
  }
}
