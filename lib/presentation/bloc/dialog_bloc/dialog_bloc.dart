import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger_app/data/repository/dialog_repository.dart';
import 'package:messenger_app/presentation/models/message.dart';

part 'dialog_bloc.freezed.dart';
part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  final DialogRepository dialogRepository;

  DialogBloc({required this.dialogRepository})
      : super(const DialogState.initial()) {
    on<LoadEvent>((event, emit) async {
      emit(const DialogState.loading());
      try {
        final messagesStream =
            dialogRepository.getMsgs(event.receiverUid, event.senderUid);
        emit(DialogState.success(messagesStream));
      } catch (e) {
        emit(const DialogState.error());
      }
    });

    on<SendEvent>((event, emit) async {
      emit(const DialogState.loading());
      try {
        await dialogRepository.sendMsg(event.receiverUid, event.message);
        final updatedMessagesStream =
            dialogRepository.getMsgs(event.receiverUid, event.senderUid);
        emit(DialogState.success(updatedMessagesStream));
      } catch (error) {
        emit(const DialogState.error());
      }
    });
  }
}
