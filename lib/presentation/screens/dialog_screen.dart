import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/data/repository/dialog_repository.dart';
import 'package:messenger_app/generated/l10n.dart';
import 'package:messenger_app/presentation/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:messenger_app/presentation/models/message.dart';
import 'package:messenger_app/presentation/widgets/app_chat_bubble.dart';
import 'package:messenger_app/theme/app_colors.dart';
import 'package:messenger_app/theme/const.dart';
import 'package:timeago/timeago.dart' as timeago;

@RoutePage()
class DialogPage extends StatefulWidget {
  final String receiverUid;
  final String receiverName;
  final Widget leading;

  const DialogPage({
    super.key,
    required this.receiverUid,
    required this.receiverName,
    required this.leading,
  });

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  late final DialogBloc _dialogBloc;
  final TextEditingController _msgController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget _buildDateSeparator(DateTime date) {
    String formattedDate = _formatDate(date);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: AppColors.strokeColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            formattedDate,
            textAlign: TextAlign.center,
            style: kDateTextStyle,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: AppColors.strokeColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dialogBloc = DialogBloc(dialogRepository: DialogRepository());
    _dialogBloc.add(LoadEvent(
      receiverUid: widget.receiverUid,
      senderUid: _auth.currentUser!.uid,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dialogBloc,
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.left_chevron,
                              size: 32,
                            ),
                            const SizedBox(width: 6),
                            widget.leading,
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.receiverName,
                                  style: kNameTextStyle,
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "В сети",
                                  style: kHintTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.strokeColor,
                height: 1,
              ),
              Expanded(
                child: BlocBuilder<DialogBloc, DialogState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const CupertinoActivityIndicator(),
                      error: () => Text(S.of(context).error),
                      success: (stream) {
                        return StreamBuilder<List<Message>>(
                          stream: stream,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CupertinoActivityIndicator();
                            } else if (snapshot.hasError) {
                              return Text(S.of(context).error);
                            } else {
                              List<Message>? messages = snapshot.data;
                              messages ??= [];
                              messages = messages.reversed.toList();
                              return ListView.builder(
                                itemCount: messages.length,
                                itemBuilder: (context, index) {
                                  final reversedIndex =
                                      messages!.length - 1 - index;
                                  final message = messages[reversedIndex];
                                  bool showDateSeparator = false;

                                  if (reversedIndex == messages.length - 1) {
                                    showDateSeparator = true;
                                  } else {
                                    DateTime curDate =
                                        message.timestamp.toDate();
                                    DateTime prevDate =
                                        messages[reversedIndex + 1]
                                            .timestamp
                                            .toDate();

                                    if (curDate.day != prevDate.day ||
                                        curDate.month != prevDate.month ||
                                        curDate.year != prevDate.year) {
                                      showDateSeparator = true;
                                    }
                                  }

                                  return Column(
                                    children: [
                                      if (showDateSeparator)
                                        _buildDateSeparator(
                                            message.timestamp.toDate()),
                                      ChatBubble(
                                        msg: message,
                                        senderUid: message.senderUid,
                                        currentUserUid: _auth.currentUser!.uid,
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              BlocProvider.value(
                value: _dialogBloc,
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        controller: _msgController,
                        obscureText: false,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<DialogBloc>(context).add(
                          SendEvent(
                            receiverUid: widget.receiverUid,
                            message: _msgController.text,
                            senderUid: _auth.currentUser!.uid,
                          ),
                        );
                        _msgController.clear();
                      },
                      icon: const Icon(Icons.arrow_upward_rounded, size: 40),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    DateTime nowInUtc = DateTime.now().toUtc();
    DateTime messageDateInUtc = date.toUtc();

    DateTime now = DateTime(nowInUtc.year, nowInUtc.month, nowInUtc.day);
    DateTime messageDate = DateTime(
      messageDateInUtc.year,
      messageDateInUtc.month,
      messageDateInUtc.day,
    );

    if (now.isAtSameMomentAs(messageDate)) {
      return 'Today';
    } else if (now
        .subtract(const Duration(days: 1))
        .isAtSameMomentAs(messageDate)) {
      return 'Yesterday';
    } else {
      return timeago.format(date, locale: 'en_short');
    }
  }
}
