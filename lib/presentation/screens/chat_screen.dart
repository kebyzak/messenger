import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:messenger_app/data/repository/user_repository.dart';
import 'package:messenger_app/generated/l10n.dart';
import 'package:messenger_app/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:messenger_app/presentation/bloc/user_bloc/user_bloc.dart';
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
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchTimer;

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const ChatEvent.fetchEvent());
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchTimer?.cancel();
    super.dispose();
  }

  void _onSearchTextChanged() {
    _searchTimer?.cancel();

    _searchTimer = Timer(const Duration(seconds: 1), () {
      final searchQuery = _searchController.text;

      if (searchQuery.isNotEmpty) {
        context.read<ChatBloc>().add(ChatEvent.searchEvent(searchQuery));
      } else {
        context.read<ChatBloc>().add(const ChatEvent.fetchEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        leading: Text(
          S.of(context).chats,
          style: kAppBarTitleStyle,
        ),
        trailing: GestureDetector(
          child: const Icon(Icons.logout_rounded),
          onTap: () {
            context.read<UserBloc>().add(const UserEvent.logoutEvent());
            AutoRouter.of(context).pushNamed('/login');
          },
        ),
        border: null,
        backgroundColor: Colors.white,
      ),
      child: Material(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 6),
                child: AppSearchBar(controller: _searchController),
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
                      loading: () =>
                          const CupertinoActivityIndicator(radius: 20),
                      error: () => Text(S.of(context).error),
                      success: (usersWithLastMessages) {
                        return ListView.builder(
                          itemCount: usersWithLastMessages.length,
                          itemBuilder: (context, index) {
                            final user = usersWithLastMessages[index];
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    CupertinoListTile(
                                      leading: CircularAva(
                                          text: user.user.name, size: 50),
                                      leadingSize: 50,
                                      title: Text(user.user.name),
                                      subtitle:
                                          Text(user.lastMessage?.message ?? ''),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DialogPage(
                                              receiverName: user.user.name,
                                              receiverUid: user.user.uid,
                                              leading: CircularAva(
                                                text: user.user.name,
                                                size: 50,
                                              ),
                                            ),
                                          ),
                                        ).then((result) {
                                          if (result == true) {
                                            context.read<ChatBloc>().add(
                                                const ChatEvent.fetchEvent());
                                          }
                                        });
                                      },
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 20,
                                      child: Text(
                                        _formatDate(user.lastMessageTime),
                                        style: kHintTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
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
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat('HH:mm').format(date);
    }
    return '';
  }
}
