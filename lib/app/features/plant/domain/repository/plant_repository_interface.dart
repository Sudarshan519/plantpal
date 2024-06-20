import 'package:plantpal/app/features/plant/data/model/plant.dart';

abstract class PlantRepository {
  Future<void> addPlantRepository(PlantModel plantModel);
  Future<List<PlantModel>> allPlants();
  Future<String> uploadImage(String image);
}
