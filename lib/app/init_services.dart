import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:plantpal/app/features/auth/domain/repository/auth_service_interface.dart';
import 'package:plantpal/app/features/auth/domain/usecase/authentication_usecase.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/routes/app_pages.dart';

import 'features/auth/data/repository/auth_repository.dart';

void initAppServices() async {
  Firebase.initializeApp().then((firebase) => Future.delayed(1.seconds, () {
        if (Get.find<AuthController>().user != null) {
          Get.offNamed(Routes.HOME);
        } else {
          Get.offNamed(Routes.INTRO);
        }
      }));
}
