import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/data/repository/user_repository.dart';
import 'package:messenger_app/generated/l10n.dart';
import 'package:messenger_app/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:messenger_app/presentation/screens/dialog_screen.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final UserRepository userRepository = UserRepository();
  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const ChatEvent.fetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text(S.of(context).chats),
      ),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const CupertinoActivityIndicator(radius: 20),
            error: () => Text(S.of(context).error),
            success: () {
              final users = context.select((ChatBloc bloc) => bloc.users);
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return CupertinoListTile(
                    title: Text(user.displayName ?? user.email ?? ''),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DialogPage(
                            userEmail: user.email ?? '',
                            receiverId: user.uid,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
