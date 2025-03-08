class MessageModel {
  const MessageModel({
    required this.id,
    required this.value,
    required this.sentBy,
    required this.createdAt,
    required this.isSender,
    required this.type,
  });

  factory MessageModel.fromMap(
    Map<String, dynamic> map, {
    bool isSender = true,
  }) {
    return MessageModel(
      id: map['id'] as String,
      value: map['value'] as String,
      sentBy: map['sentBy'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      isSender: isSender,
      type: map['type'] != null ? _fromString(map['type']) : MessageType.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'sentBy': sentBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'type': type.name,
    };
  }

  final String id;
  final String value;
  final String sentBy;
  final DateTime createdAt;
  final bool isSender;
  final MessageType type;
}

enum MessageType {
  text,
  image,
  ;
}

MessageType _fromString(String value) {
  switch (value) {
    case 'text':
      return MessageType.text;
    case 'image':
      return MessageType.image;
    default:
      return MessageType.text;
  }
}
