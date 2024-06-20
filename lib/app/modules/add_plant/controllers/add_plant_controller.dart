import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/features/home/data/model/plant.dart';
import 'package:plantpal/app/features/home/domain/repository/plant_repository_interface.dart';
import 'package:plantpal/app/features/home/presentation/plant_controller.dart';

class AddPlantController extends GetxController {
  //TODO: Implement AddPlantController
  final PlantRepository plantRepository = Get.find();
  final count = 0.obs;
  var selectedImage = ''.obs;
  var image_uploading = false.obs;
  var uploadingPlant = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  Future<void> uploadImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      image_uploading(true);
      selectedImage(await plantRepository.uploadImage(image?.path ?? ""));
      image_uploading(false);
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
