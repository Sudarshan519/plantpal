import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plantpal/app/core/constants.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      transitionDuration: 300.milliseconds,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
    theme: ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      scaffoldBackgroundColor: backgroundColor),
    ),
  );
}