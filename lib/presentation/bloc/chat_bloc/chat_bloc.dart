import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger_app/data/repository/user_repository.dart';
import 'package:messenger_app/presentation/models/last_user.dart';
import 'package:messenger_app/presentation/models/message.dart';
import 'package:messenger_app/presentation/models/user_model.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final UserRepository userRepository;
  List<UserWithLastMessage> usersWithLastMessages = [];

  ChatBloc({required this.userRepository}) : super(const ChatState.initial()) {
    on<_FetchUsers>((event, emit) async {
      emit(const ChatState.loading());
      try {
        final List<UserModel> users = await userRepository.fetchUsers();
        final List<UserWithLastMessage> usersWithLastMessages = [];

        for (final user in users) {
          final List<Message> lastMessages =
              await userRepository.getLastMessages(user.uid);

          final Message? lastMessage =
              lastMessages.isNotEmpty ? lastMessages.first : null;

          final DateTime? lastMessageTime = lastMessage?.timestamp.toDate();

          usersWithLastMessages.add(UserWithLastMessage(
            user: user,
            lastMessage: lastMessage,
            lastMessageTime: lastMessageTime,
          ));
        }
        emit(ChatState.success(usersWithLastMessages: usersWithLastMessages));
      } catch (e) {
        emit(const ChatState.error());
      }
    });

    on<_SearchUsers>((event, emit) async {
      emit(const ChatState.loading());
      try {
        final filteredUsers = usersWithLastMessages
            .where((user) => user.user.name
                .toLowerCase()
                .startsWith(event.query.toLowerCase()))
            .toList();

        usersWithLastMessages = filteredUsers;

        emit(ChatState.success(usersWithLastMessages: usersWithLastMessages));
      } catch (e) {
        emit(const ChatState.error());
      }
    });

    on<_NewMessage>((event, emit) {
      final List<UserWithLastMessage> updatedUsersWithLastMessages =
          List.from(usersWithLastMessages);

      for (var i = 0; i < updatedUsersWithLastMessages.length; i++) {
        if (updatedUsersWithLastMessages[i].user.uid ==
                event.newMessage.senderUid ||
            updatedUsersWithLastMessages[i].user.uid ==
                event.newMessage.receiverUid) {
          final DateTime lastMessageTime = event.newMessage.timestamp.toDate();

          updatedUsersWithLastMessages[i] = UserWithLastMessage(
            user: updatedUsersWithLastMessages[i].user,
            lastMessage: event.newMessage,
            lastMessageTime: lastMessageTime,
          );

          break;
        }
      }

      emit(ChatState.success(
        usersWithLastMessages: updatedUsersWithLastMessages,
      ));
    });
  }
}
