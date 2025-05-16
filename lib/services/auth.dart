import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///signUP
  Future<User?> registerUser({
    required String email,
    required String password,
    required String name,
    required String phone,
    String? address,
    String? image,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.sendEmailVerification();

      await _firestore.collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'phone': phone,
        'address': address,
        'image': image,
        'docId': userCredential.user!.uid,
      });

      return userCredential.user;
    } catch (e) {
      print("Registration Error: $e");
      return null;
    }
  }

  ///login
  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await _auth.signOut();
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'Please verify your email before logging in.',
        );
      }

      return userCredential.user;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }





  ///reset password
  Future resetPassword(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }

  ///sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('User signed out successfully');
    } catch (e) {
      print('Sign out error: $e');
      throw Exception('Failed to sign out: $e');
    }
  }
}