import 'package:get/get.dart';
import 'package:plantpal/app/features/home/data/repository/plant_repository.dart';
import 'package:plantpal/app/features/home/domain/repository/plant_repository_interface.dart';
import 'package:plantpal/app/features/home/presentation/plant_controller.dart';

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
