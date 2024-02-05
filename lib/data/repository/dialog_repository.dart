import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/presentation/models/message.dart';

class DialogRepository extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMsg(String receiverUid, String msg) async {
    final String currentUserUid = _auth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();
    final userDoc = await _db.collection('users').doc(currentUserUid).get();
    final currentUserName = userDoc['name'] as String? ?? 'Unknown';

    Message newMsg = Message(
      senderUid: currentUserUid,
      senderName: currentUserName,
      receiverUid: receiverUid,
      message: msg,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserUid, receiverUid];
    ids.sort();
    String chatId = ids.join("_");

    await _db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(newMsg.toMap());
  }

  Future<Map<String, String>> getLastMessageAndTime(String userId) async {
    final currentUserUid = _auth.currentUser!.uid;
    final List<String> ids = [currentUserUid, userId];
    ids.sort();
    final String chatId = ids.join("_");

    final snapshot = await _db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final lastMessage = snapshot.docs.first['message'] as String;
      final timestamp = snapshot.docs.first['timestamp'] as Timestamp;
      final lastMessageTime = timestamp.toDate().toString();

      return {'lastMessage': lastMessage, 'lastMessageTime': lastMessageTime};
    }

    return {'lastMessage': '', 'lastMessageTime': ''};
  }

  Stream<List<Message>> getMsgs(String firstUid, String secondUid) {
    List<String> ids = [firstUid, secondUid];
    ids.sort();
    String chatId = ids.join("_");

    return _db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .asyncMap((QuerySnapshot querySnapshot) async {
      final List<Message> messages = [];

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final message = Message.fromMap(data);
        messages.add(message);
      }
      return messages;
    });
  }
}
