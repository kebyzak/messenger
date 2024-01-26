import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/data/repository/user_repository.dart';
import 'package:messenger_app/generated/l10n.dart';
import 'package:messenger_app/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:messenger_app/presentation/screens/dialog_screen.dart';
import 'package:messenger_app/presentation/widgets/app_circular_ava.dart';
import 'package:messenger_app/presentation/widgets/app_searchbar.dart';
import 'package:messenger_app/theme/app_colors.dart';
import 'package:messenger_app/theme/const.dart';

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
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        leading: Text(
          S.of(context).chats,
          style: kAppBarTitleStyle,
        ),
        border: null,
        backgroundColor: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 24, top: 6),
              child: AppSearchBar(),
            ),
            const Divider(
              color: AppColors.strokeColor,
              height: 1,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const CupertinoActivityIndicator(radius: 20),
                    error: () => Text(S.of(context).error),
                    success: () {
                      final users =
                          context.select((ChatBloc bloc) => bloc.users);
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  CupertinoListTile(
                                    leading:
                                        CircularAva(text: user.name, size: 50),
                                    leadingSize: 50,
                                    title: Text(user.name),
                                    subtitle: const Text('Test text'),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DialogPage(
                                            userEmail: user.email,
                                            receiverId: user.uid,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const Positioned(
                                    top: 8,
                                    right: 20,
                                    child: Text('22:12', style: kHintTextStyle),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(
                                  height: 20,
                                  color: AppColors.strokeColor,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
