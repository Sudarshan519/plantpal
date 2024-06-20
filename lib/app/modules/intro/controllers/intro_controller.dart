import 'package:get/get.dart';
import 'package:plantpal/app/core/constants.dart';

class IntroController extends GetxController {
  final count = 0.obs;
  final introText = [].obs;
  @override
  void onInit() {
    super.onInit();
    runLoop();
  }



  void increment() => count.value++;

  Future<void> runLoop() async {
    while (introText.length < introTexts.length) {
      await Future.delayed(1.seconds, () {
        introText.add(introTexts[count.value]);
        count(count.value + 1);
      });
    }
  }
}
