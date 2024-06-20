import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/modules/home/views/home_view.dart';
import 'package:plantpal/app/routes/app_pages.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Nursery extends StatelessWidget {
  const Nursery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: 256.h,
            child: const BackroundImage()),
        ListTile(
          tileColor: const Color(0xffECF8EC),
          onTap: () async {
            authController.signOut();
            Get.toNamed(Routes.SIGNUP);
          },
          leading: const CircleAvatar(
            backgroundColor: const Color(0xffECF8EC),
            child: Icon(
              Icons.door_sliding_outlined,
              color: darkGreeTextColor,
            ),
          ),
          title: Text(
            "Logout",
            style: GoogleFonts.ebGaramond(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: darkGreeTextColor,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: darkGreeTextColor,
            size: 16.sp,
          ),
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          alignment: Alignment.center,
          height: 48.h,
          width: 139.w,
          decoration: BoxDecoration(
            color: const Color(0xffEAF6E0),
            border: const Border(
                bottom: BorderSide(color: Color(0xffBAD8A0), width: 3)),
            borderRadius: BorderRadius.circular(12).r,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff16611F),
            ),
          )),
    );
  }
}
