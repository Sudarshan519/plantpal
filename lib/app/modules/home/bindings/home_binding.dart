import 'package:get/get.dart';
import 'package:plantpal/app/features/plant/data/repository/plant_repository.dart';
import 'package:plantpal/app/features/plant/domain/repository/plant_repository_interface.dart';
import 'package:plantpal/app/features/plant/presentation/plant_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlantRepository>(
      () => PlantRepositoryImpl() as PlantRepository,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(() => PlantController());
  }
}
