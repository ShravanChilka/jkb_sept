class MessageModel {
  const MessageModel({
    required this.id,
    required this.value,
    required this.sentBy,
    required this.createdAt,
    required this.isSender,
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'sentBy': sentBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  final String id;
  final String value;
  final String sentBy;
  final DateTime createdAt;
  final bool isSender;
}
