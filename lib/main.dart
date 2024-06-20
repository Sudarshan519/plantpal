import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/core/themes/app_theme.dart';
import 'package:plantpal/app/initial_bindings.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
