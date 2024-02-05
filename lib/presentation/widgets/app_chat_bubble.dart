import 'package:flutter/cupertino.dart';
import 'package:messenger_app/presentation/models/message.dart';
import 'package:messenger_app/theme/app_colors.dart';
import 'package:messenger_app/theme/const.dart';

class ChatBubble extends StatelessWidget {
  final Message msg;
  final String senderUid;
  final String currentUserUid;

  const ChatBubble({
    super.key,
    required this.msg,
    required this.senderUid,
    required this.currentUserUid,
  });

  @override
  Widget build(BuildContext context) {
    var alignment = (senderUid == currentUserUid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    var bubbleRadius = BorderRadius.only(
      topLeft: const Radius.circular(16.0),
      topRight: const Radius.circular(16.0),
      bottomLeft: alignment == Alignment.centerLeft
          ? const Radius.elliptical(10.0, 16.0)
          : const Radius.circular(16.0),
      bottomRight: alignment == Alignment.centerRight
          ? const Radius.elliptical(10.0, 16.0)
          : const Radius.circular(16.0),
    );

    var bubbleColor = (senderUid == currentUserUid)
        ? AppColors.messageColor
        : AppColors.strokeColor;

    var textStyle =
        (senderUid == currentUserUid) ? kSentTextStyle : kReceivedTextStyle;

    var timeString = _formatTime(msg.timestamp.toDate());

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: bubbleRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(msg.message, style: textStyle.copyWith(fontSize: 14)),
            ),
            const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 14, 15, 2),
              child: Text(
                timeString,
                style: textStyle.copyWith(fontSize: 8.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
