import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/init_services.dart';
 

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    initAppServices();

    return Scaffold(
      backgroundColor: splashColor,
      body: Center(
          child: Image.asset(
        'assets/LOGO(1).png',
        height: 84 ,
        width: 220,
        fit: BoxFit.fitHeight,
      )),
    );
  }
}
