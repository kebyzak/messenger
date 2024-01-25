part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.loginEvent({
    required String email,
    required String password,
  }) = _LoginEvent;
  const factory UserEvent.registerEvent({
    required String email,
    required String password,
    required String name,
  }) = _RegisterEvent;
  const factory UserEvent.logoutEvent() = _LogoutEvent;
}
