import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantpal/app/core/failure/auth_failure.dart';

abstract class AuthServiceInterface {
  Stream<User?> get authStateChanges;
  User? get user;

  Future<Either<AuthFailure, UserCredential>> loginWithGoogle(
      {String? username, String? selectedFeature});
  Future<void> signOut();
}
