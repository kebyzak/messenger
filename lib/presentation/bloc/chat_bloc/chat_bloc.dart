import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger_app/data/repository/user_repository.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final UserRepository userRepository;
  List<User> users = [];
  ChatBloc({required this.userRepository}) : super(const ChatState.initial()) {
    on<_FetchUsers>((event, emit) async {
      emit(const ChatState.loading());

      try {
        users = await userRepository.fetchUsers();
        emit(const ChatState.success());
      } catch (e) {
        emit(const ChatState.error());
      }
    });
  }
}