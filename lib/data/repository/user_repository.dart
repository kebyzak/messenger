import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user =
          await _firestore.collection('users').doc(result.user!.uid).get();
      final displayName = user['name'] as String;

      await result.user!.updateDisplayName(displayName);

      return result.user!;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signUp({
    required email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(result.user!.uid).set({
        'uid': result.user!.uid,
        'name': name,
        'email': email,
      });

      await result.user!.updateDisplayName(name);
      return result.user!;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<User>> fetchUsers() async {
    try {
      List<User> users = [];

      await _firestore.collection('users').get().then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          final userData = doc.data();
          final uid = userData['uid'];
          final existingUser = users.firstWhere(
            (user) => user.uid == uid,
          );

          if (existingUser == null) {
            final user = _firebaseAuth.currentUser;
            users.add(user!);
          }
        }
      });

      return users;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
