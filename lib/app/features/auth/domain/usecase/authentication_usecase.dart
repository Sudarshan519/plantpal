import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantpal/app/features/auth/domain/repository/auth_service_interface.dart';
import 'package:plantpal/app/features/auth/domain/usecase/auth_usecase_failure.dart';

class AuthenticationUseCase {
  final AuthServiceInterface _authService;

  AuthenticationUseCase(this._authService);
  User? currentUser() => _authService.user;
  Future<Either<AuthUseCaseFailure, UserCredential>> signIn(
      {String? username, String? selectedFeature}) async {
    final result = await _authService.loginWithGoogle(
        username: username, selectedFeature: selectedFeature);
    return result.fold(
      (failure) => Left(AuthUseCaseFailure(message: failure.message)),
      (user) => Right(user),
    );
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
