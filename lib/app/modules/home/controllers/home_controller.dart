import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final _selectedNav = 0.obs;
  int get selectedNav => _selectedNav.value;
  set selectedNav(int i) => _selectedNav(i);
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

  void increment() => _selectedNav.value++;
}
