import 'package:flutter/cupertino.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onOkPressed;

  const AppAlertDialog({
    super.key,
    required this.title,
    this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Gilroy',
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onOkPressed,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
