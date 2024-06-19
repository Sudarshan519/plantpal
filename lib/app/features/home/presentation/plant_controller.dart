import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plantpal/app/features/home/data/model/plant.dart';
import 'package:plantpal/app/features/home/domain/repository/plant_repository_interface.dart';

class PlantController extends GetxController with StateMixin<List<PlantModel>> {
  final PlantRepository plantRepository = Get.find();
  var plants = <PlantModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadPlants();
  }

  void loadPlants() async {
    change(null, status: RxStatus.loading());
    try {
      var plants = await plantRepository.allPlants();
      change(plants, status: RxStatus.success());
    } on PlatformException catch (e) {
      change(null, status: RxStatus.error(e.message.toString()));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
