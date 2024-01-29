import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderUid;
  final String senderName;
  final String receiverUid;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderUid,
    required this.senderName,
    required this.receiverUid,
    required this.message,
    required this.timestamp,
  });

  Message.fromMap(Map<String, dynamic> map)
      : senderUid = map['senderUid'],
        senderName = map['senderName'],
        receiverUid = map['receiverUid'],
        message = map['message'],
        timestamp = map['timestamp'];

  Map<String, dynamic> toMap() {
    return {
      'senderUid': senderUid,
      'senderName': senderName,
      'receiverUid': receiverUid,
      'message': message,
      'timestamp': timestamp,
    };
  }

  @override
  String toString() {
    return 'Message{senderUid: $senderUid, senderName: $senderName, receiverUid: $receiverUid, message: $message, timestamp: $timestamp}';
  }
}
