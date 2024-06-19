import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantpal/app/features/home/data/model/plant.dart';
import 'package:plantpal/app/features/home/domain/repository/plant_repository_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PlantRepositoryImpl implements PlantRepository {
  @override
  Future<void> addPlantRepository(PlantModel plantModel) async {
    await FirebaseFirestore.instance
        .collection('plants')
        .add(plantModel.toJson());
  }

  @override
  Future<List<PlantModel>> allPlants() async {
    var plants = await FirebaseFirestore.instance
        .collection('plants')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get();
    return plants.docs
        .map((plant) => PlantModel.fromDocumentSnapshot(plant))
        .toList();
  }

  @override
  Future<String> uploadImage(String image) async {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref('/plants');
    TaskSnapshot task = await storageRef.putFile(File(image));
    return task.ref.getDownloadURL();
  }
}
