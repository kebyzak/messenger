part of 'dialog_bloc.dart';

@freezed
class DialogState with _$DialogState {
  const factory DialogState.initial() = Initial;
  const factory DialogState.loading() = Loading;
  const factory DialogState.error() = Error;
  const factory DialogState.success(Stream<List<Message>> messagesStream) =
      Success;
}
