import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plantpal/app/features/plant/data/model/plant.dart';
import 'package:plantpal/app/features/plant/domain/repository/plant_repository_interface.dart';

class PlantController extends GetxController with StateMixin<List<PlantModel>> {
  final PlantRepository plantRepository = Get.find();
 

  @override
  void onInit() {
    super.onInit();

    loadPlants();
  }

  Future<void> loadPlants() async {
    change(null, status: RxStatus.loading());
    try {
      var result = await plantRepository.allPlants();
    result.fold((left){
      change(null,status: RxStatus.error(left.message));
    },(plants){
      change(plants, status: RxStatus.success());
    }) ; 
    } on PlatformException catch (e) {
      change(null, status: RxStatus.error(e.message.toString()));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
