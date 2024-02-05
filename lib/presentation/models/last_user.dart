// Assuming you have a UserWithLastMessage model like this:
import 'package:messenger_app/presentation/models/message.dart';
import 'package:messenger_app/presentation/models/user_model.dart';

class UserWithLastMessage {
  final UserModel user;
  final Message? lastMessage;
  final DateTime? lastMessageTime;

  UserWithLastMessage({
    required this.user,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  @override
  String toString() {
    return 'UserWithLastMessage(user: ${user.name}, lastMessage: ${lastMessage?.message}, lastMessageTime: $lastMessageTime)';
  }
}
