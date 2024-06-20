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
      selectedImage(await plantRepository.uploadImage(image.path));
      imageUploading(false);
    }
  }

  Future<void> uploadPlant(String name, String description) async {
    uploadingPlant(true);
    await plantRepository.addPlantRepository(PlantModel(
        name: name,
        description: description,
        image: selectedImage.value,
        email: Get.find<AuthController>().user?.email ?? ""));
    uploadingPlant(true);
    final PlantController controller = Get.find();
    controller.loadPlants();
    Get.back();
  }
}
