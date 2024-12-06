import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/login/login.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userData = await getCurrentUser();
      if (userData == null) {
        throw Exception('User data not found');
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  Future<void> register(String email, String password, String username,
      BuildContext context) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(credential.user!.uid).set({
        'username': username,
        'email': email,
        'photoUrl': null,
      });

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateProfile(String username, String? photoPath) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'username': username,
        'photoUrl': photoPath,
      });
    }
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      if (_auth.currentUser == null) {
        print('No current user found');
        return null;
      }

      final doc = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (!doc.exists) {
        print('No user document found for ${_auth.currentUser!.uid}');
        return null;
      }

      print('Retrieved user data: ${doc.data()}');
      return doc.data();
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }
}
