import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:plantpal/app/features/auth/domain/usecase/auth_usecase_failure.dart';
import 'package:plantpal/app/features/auth/domain/usecase/authentication_usecase.dart';

class AuthController extends GetxController {
  final AuthenticationUseCase _authUseCase;
  User? _user;
  final authenticated = false.obs;

  final selectedFeature = ''.obs;
  final username = ''.obs;
  AuthController(this._authUseCase) {
    // Initialize auth state
    _init();
  }

  void _init() {
    _user = _authUseCase.currentUser();

    if (_user != null) {
      username(_user?.displayName);
      authenticated(true);
    }
  }

  User? get user => _user;

  Future<Either<AuthUseCaseFailure, UserCredential>> signIn() async {
    Either<AuthUseCaseFailure, UserCredential> result =
        await _authUseCase.signIn(
            username: username.value, selectedFeature: selectedFeature.value);
    result.fold((left) {}, (user) {
      _user = user.user;
    });
    return result;
  }

  Future<void> signOut() async {
    await _authUseCase.signOut();

    _user = null;
  }
}
