import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/chat/chat/model/message_model.dart';

class RecentChatModel {
  final UserModel user;
  final MessageModel message;

  const RecentChatModel({
    required this.user,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'message': message.toMap(),
    };
  }

  factory RecentChatModel.fromMap(Map<String, dynamic> map) {
    return RecentChatModel(
      user: UserModel.fromMap(
        map['user'] as Map<String, dynamic>,
      ),
      message: MessageModel.fromMap(
        map['message'] as Map<String, dynamic>,
      ),
    );
  }
}
