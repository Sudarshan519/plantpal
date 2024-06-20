import 'package:get/get.dart';
import 'package:plantpal/app/features/auth/data/repository/auth_repository.dart';
import 'package:plantpal/app/features/auth/domain/repository/auth_repository.dart';
import 'package:plantpal/app/features/auth/domain/usecase/authentication_usecase.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl() as AuthRepository,
        fenix: true);
    Get.lazyPut<AuthController>(
        () => AuthController(
              AuthenticationUseCase(Get.find()),
            ),
        fenix: true);
  }
}
