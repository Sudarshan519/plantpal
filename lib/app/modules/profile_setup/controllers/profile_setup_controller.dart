import 'dart:ffi';

import 'package:get/get.dart';
class Feature{
 final String image;
 final String label;

  Feature({required this.image, required this.label});
}
final featues=[
  Feature(image: 'assets/natural-product 1.png', label: "Plant Care"),
   Feature(image: 'assets/community 1.png', label: "Plant Lover Community"),
   Feature(image: 'assets/market 1.png',label: 'Plant Marketplace')
];

class ProfileSetupController extends GetxController {
 

  final _count = 0.obs;
 int get  count=>_count.value;
 set count(int count)=>_count(count);
 final selectedFeature=''.obs;
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

  void increment() =>count<3? _count.value++:_count.value;
}
