import 'package:get/get.dart';
import 'package:plantpal/app/core/constants.dart';

class IntroController extends GetxController {
  //TODO: Implement IntroController

  final count = 0.obs;
  final introText=[].obs;
  @override
  void onInit() {
    super.onInit();
   runLoop();
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
  
  Future<void> runLoop() async {
     while (introText.length<introTexts.length) {
    await  Future.delayed(1.seconds,(){
        introText.add(introTexts[count.value]);
        count(count.value+1);
      });
    }
  }
}
