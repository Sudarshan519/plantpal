import 'package:get/get.dart';

class HomeController extends GetxController {
  final _selectedNav = 0.obs;
  int get selectedNav => _selectedNav.value;
  set selectedNav(int i) => _selectedNav(i);

  void increment() => _selectedNav.value++;
}
