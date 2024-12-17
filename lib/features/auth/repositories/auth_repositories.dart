import 'dart:io';
import 'package:facebook_clone/core/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthRepositories {
  final _auth = FirebaseAuth.instance;
  // final _storage = FirebaseStorage.instance;
  // final _firestore = FirebaseFirestore.instance;

  //Sign In
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential;
    } catch (e) {
      showToastMessage(text: e.toString());
      return null;
    }
  }

  // Sign Out
  Future<String?> signOut() async {
    try {
      _auth.signOut();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Create Account
  Future<UserCredential?> createAccount({
    required String fullName,
    required DateTime birthDay,
    required String gender,
    required String email,
    required String password,
    required File? image,
  }) async {
    try {
      // create an account in firebase
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Save image to firebase storage

      // save user to firestore

      return credential;
    } catch (e) {
      showToastMessage(text: e.toString());
      return null;
    }
  }

  // Verify Email
  Future<String?> verifyEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        user.sendEmailVerification();
      }
      return null;
    } catch (e) {
      showToastMessage(text: e.toString());
      return e.toString();
    }
  }

  // get user info
  // Future<User> getUserInfo() async {
  //   final userData = await _firestore
  //       .collection(FirebaseCollectionNames.users)
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   final user = UserModel.fromMap(userData.data()!);

  //   return user;
  // }
}
