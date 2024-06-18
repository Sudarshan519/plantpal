import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantpal/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void initAppServices()async{
  WidgetsFlutterBinding.ensureInitialized();
    Future.delayed(2.seconds,(){
    Get.offNamed(Routes.INTRO);
  });
  // Firebase.initializeApp().then((firebase) => Future.delayed(2.seconds,(){
  //   Get.offNamed(Routes.INTRO);
  // }));
}