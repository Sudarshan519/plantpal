import 'package:get/get.dart';
import 'package:plantpal/app/features/auth/data/repository/auth_repository.dart';
import 'package:plantpal/app/features/auth/domain/repository/auth_service_interface.dart';
import 'package:plantpal/app/features/auth/domain/usecase/authentication_usecase.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthServiceInterface>(
        () => AuthRepositoryImpl() as AuthServiceInterface,
        fenix: true);
    Get.lazyPut<AuthController>(
        () => AuthController(
              AuthenticationUseCase(Get.find()),
            ),
        fenix: true);
  }
}
