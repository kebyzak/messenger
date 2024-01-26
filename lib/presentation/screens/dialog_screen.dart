import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage()
class DialogPage extends StatelessWidget {
  final String userEmail;
  final String receiverId;
  const DialogPage({
    super.key,
    required this.userEmail,
    required this.receiverId,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Dialog Page'),
      ),
      child: Text(receiverId),
    );
  }
}
