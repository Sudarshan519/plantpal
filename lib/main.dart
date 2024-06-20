import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:plantpal/app/core/themes/app_theme.dart';
import 'package:plantpal/app/initial_bindings.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(
    GetMaterialApp(
      title: "PlantPal",
      initialRoute: AppPages.INITIAL,
      transitionDuration: 300.milliseconds,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      initialBinding: InitialBindings(),
      theme: theme(),
    ),
  );
}
