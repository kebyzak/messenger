part of 'dialog_bloc.dart';

@freezed
class DialogEvent with _$DialogEvent {
  const factory DialogEvent.loadEvent({
    required String receiverUid,
    required String senderUid,
  }) = LoadEvent;
  const factory DialogEvent.sendEvent({
    required String receiverUid,
    required String message,
    required String senderUid,
  }) = SendEvent;
}
