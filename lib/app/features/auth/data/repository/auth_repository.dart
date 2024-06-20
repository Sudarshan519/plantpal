import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantpal/app/core/failure/auth_failure.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plantpal/app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<AuthFailure, UserCredential>> loginWithGoogle(
      {String? username, String? selectedFeature}) async {
    try {
      // Remove previouse logged in google user if any
      await GoogleSignIn().signOut();
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential? userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (username?.isNotEmpty == true) {
        userCredential.user?.updateDisplayName(username);
      }

      /// update user name and feature
      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({"username": username, "selectedFeature": selectedFeature});
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(message: e.message ?? ""));
    }
  }

  @override
  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  User? get user => FirebaseAuth.instance.currentUser;
}
