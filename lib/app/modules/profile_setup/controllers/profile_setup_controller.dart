import 'package:get/get.dart';
import 'package:plantpal/app/core/app_assets/app_assets.dart';

class Feature {
  final String image;
  final String label;

  Feature({required this.image, required this.label});
}

final featues = [
  Feature(image: AppAssets.naturalProduct1, label: "Plant Care"),
  Feature(image: AppAssets.community1, label: "Plant Lover Community"),
  Feature(image: AppAssets.market1, label: 'Plant Marketplace')
];

class ProfileSetupController extends GetxController {
  final _count = 0.obs;
  int get count => _count.value;
  set count(int count) => _count(count);
  final selectedFeature = ''.obs;

  void increment() => count < 3 ? _count.value++ : _count.value;
}
