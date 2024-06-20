import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:plantpal/app/core/failure/server_failure.dart';
import 'package:plantpal/app/features/plant/data/model/plant.dart';

abstract class PlantRepository {
  Future<Either<ServerFailure, DocumentReference<Map<String, dynamic>>?>> addPlantRepository(PlantModel plantModel);
  Future<Either<ServerFailure, List<PlantModel>>> allPlants();
  Future<Either<ServerFailure, String>> uploadImage(String image);
}
