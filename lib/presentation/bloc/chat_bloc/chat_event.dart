part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.fetchEvent() = _FetchUsers;
  const factory ChatEvent.searchEvent(String query) = _SearchUsers;
}
