import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:plantpal/app/core/app_assets/app_assets.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/init_services.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    initAppServices();

    return Scaffold(
      backgroundColor: splashColor,
      body: Center(
          child: Image.asset(
        AppAssets.logo1_,
        height: 84,
        width: 220,
        fit: BoxFit.fitHeight,
      )),
    );
  }
}
