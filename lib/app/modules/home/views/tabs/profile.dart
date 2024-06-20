import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/modules/home/views/home_view.dart';
import 'package:plantpal/app/routes/app_pages.dart';

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
            Get.offNamed(Routes.SIGNUP);
          },
          leading: const CircleAvatar(
            backgroundColor: Color(0xffECF8EC),
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
