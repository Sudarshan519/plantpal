import 'package:get/get.dart';

import '../controllers/start_journey_controller.dart';

class StartJourneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartJourneyController>(
      () => StartJourneyController(),
    );
  }
}
