import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger_app/data/repository/user_repository.dart';
import 'package:messenger_app/presentation/models/user_model.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  String? userId;
  List<UserModel> users = [];

  UserBloc({required this.userRepository}) : super(const UserState.initial()) {
    on<_LoginEvent>((event, emit) async {
      emit(const UserState.loading());
      try {
        await userRepository.signIn(
          password: event.password,
          email: event.email,
        );
        emit(const UserState.success());
      } catch (e) {
        emit(const Error());
      }
    });

    on<_RegisterEvent>((event, emit) async {
      emit(const UserState.loading());
      try {
        await userRepository.signUp(
          password: event.password,
          email: event.email,
          name: event.name,
        );
        emit(const UserState.success());
      } catch (e) {
        emit(const Error());
      }
    });

    on<_LogoutEvent>((event, emit) async {
      await userRepository.logout();
      emit(const UserState.initial());
    });
  }
}
