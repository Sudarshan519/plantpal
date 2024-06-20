import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantpal/app/core/failure/server_failure.dart';
import 'package:plantpal/app/features/plant/data/model/plant.dart';
import 'package:plantpal/app/features/plant/domain/repository/plant_repository_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PlantRepositoryImpl implements PlantRepository {
  @override
  Future<Either<ServerFailure, DocumentReference<Map<String, dynamic>>?>>
      addPlantRepository(PlantModel plantModel) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('plants')
          .add(plantModel.toJson());
      return Right(result);
    } on SocketException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Something went wrong'));
    }
  }

  @override
  Future<Either<ServerFailure, List<PlantModel>>> allPlants() async {
    try {
      var plants = await FirebaseFirestore.instance
          .collection('plants')
          .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
          .get();
      return Right(plants.docs
          .map((plant) => PlantModel.fromDocumentSnapshot(plant))
          .toList());
    } on SocketException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Something went wrong'));
    }
  }

  @override
  Future<Either<ServerFailure, String>> uploadImage(String image) async {
    try {
      // Create a storage reference from our app

      final storageRef = FirebaseStorage.instance.ref('/plants');
      TaskSnapshot task = await storageRef.putFile(File(image));
      return Right(await task.ref.getDownloadURL());
    } on SocketException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Something went wrong'));
    }
  }
}
