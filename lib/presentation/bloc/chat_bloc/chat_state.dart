part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = Initial;
  const factory ChatState.loading() = Loading;
  const factory ChatState.error() = Error;
  const factory ChatState.success({
    required List<UserWithLastMessage> usersWithLastMessages,
  }) = _Success;
}
