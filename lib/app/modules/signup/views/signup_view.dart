import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/modules/intro/views/intro_view.dart';
import 'package:plantpal/app/modules/profile_setup/views/profile_setup_view.dart';
import 'package:plantpal/app/routes/app_pages.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ProfileProgress(
          progress: 3,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            const Expanded(child: CreateAccountWidget()),
            Hero(
              tag: 'button',
              child: AppButton(
                btnTextColor: const Color(0xff0B3010),
                color: creatAccountBtnColor,
                icon: SvgPicture.asset('assets/svg/social media logo.svg'),
                title: 'Create with Google',
                onPressed: () {
                  AuthController authController = Get.find();

                  authController.signIn().then((onResponse) {
                    onResponse.fold((left) {
                      Get.snackbar("Error", left.message);
                    }, (right) => Get.offNamed(Routes.HOME));
                  });
                },
              ).animate(target: 1).fade(end: 0.8).scaleXY(end: 1),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: "By continuing, you agree to Plant Pal\n",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff464646))),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff464646))),
                      const TextSpan(text: ' and '),
                      TextSpan(
                          text: 'Terms of Use',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff464646))),
                    ],
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff464646))),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
