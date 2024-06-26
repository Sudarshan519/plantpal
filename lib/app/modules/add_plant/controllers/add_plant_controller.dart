import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/features/plant/data/model/plant.dart';
import 'package:plantpal/app/features/plant/domain/repository/plant_repository_interface.dart';
import 'package:plantpal/app/features/plant/presentation/plant_controller.dart';

class AddPlantController extends GetxController {
  final PlantRepository plantRepository = Get.find();
  final count = 0.obs;
  var selectedImage = ''.obs;
  var imageUploading = false.obs;
  var uploadingPlant = false.obs;

  void increment() => count.value++;
  Future<void> uploadImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageUploading(true);
      await plantRepository.uploadImage(image.path).then((result) {
        result.fold((left) {
          Get.snackbar('Error', left.message);
        }, (result) {
          selectedImage(result);
        });
      });

      imageUploading(false);
    }
  }

  Future<void> uploadPlant(String name, String description) async {
    uploadingPlant(true);
    try {
      await plantRepository
          .addPlantRepository(PlantModel(
              name: name,
              description: description,
              image: selectedImage.value,
              email: Get.find<AuthController>().user?.email ?? ""))
          .then((result) {
        result.fold((left) {
          Get.snackbar('Error', left.message);
        }, (right) {
          uploadingPlant(true);
        });
      });
    } on FirebaseException catch (e) {
       Get.snackbar('Error', e.message??"");
    }

    final PlantController controller = Get.find();
    controller.loadPlants();
    Get.back();
  }
}
