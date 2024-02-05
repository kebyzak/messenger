import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger_app/presentation/models/message.dart';
import 'package:messenger_app/presentation/models/user_model.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = await _db.collection('users').doc(result.user!.uid).get();
      final displayName = user['name'] as String;

      await result.user!.updateDisplayName(displayName);

      return UserModel.fromSnapshot(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> signUp({
    required email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _db.collection('users').doc(result.user!.uid).set({
        'uid': result.user!.uid,
        'name': name,
        'email': email,
      });

      await result.user!.updateDisplayName(name);
      final user = await _db.collection('users').doc(result.user!.uid).get();
      return UserModel.fromSnapshot(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> fetchUsers() async {
    try {
      final currentUserUid = _auth.currentUser?.uid;

      final snapshot = await _db.collection('users').get();
      final userData = snapshot.docs
          .map((e) => UserModel.fromSnapshot(e))
          .where((user) => user.uid != currentUserUid)
          .toList();
      return userData;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Message>> getLastMessages(String userId) async {
    try {
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
        final messages =
            snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList();

        return messages;
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
