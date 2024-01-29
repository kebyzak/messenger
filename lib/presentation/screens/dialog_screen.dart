import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/data/repository/dialog_repository.dart';
import 'package:messenger_app/generated/l10n.dart';
import 'package:messenger_app/presentation/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:messenger_app/presentation/models/message.dart';

@RoutePage()
class DialogPage extends StatefulWidget {
  final String receiverUid;
  final String receiverName;

  const DialogPage({
    super.key,
    required this.receiverUid,
    required this.receiverName,
  });

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  late final DialogBloc _dialogBloc;
  final TextEditingController _msgController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
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
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return ListView(
                                  children: snapshot.data
                                          ?.map((msg) => _appMessage(msg))
                                          .toList() ??
                                      [],
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
      ),
    );
  }

  Widget _appMessage(Message msg) {
    var alignment = (msg.senderUid == _auth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        children: [
          Text(msg.senderName),
          Text(msg.message),
        ],
      ),
    );
  }
}
