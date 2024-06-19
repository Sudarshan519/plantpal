import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/routes/app_pages.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column( 
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Image.asset(
                'assets/image 5(1).png',
                height: 200.h,
                fit: BoxFit.fitHeight,
              ),
            ),
              SizedBox(
              height: 16.h,
            ),
            Text(
              "Your Ultimate Plant\nCare Companion!",
              style: GoogleFonts.ebGaramond(
                fontWeight: FontWeight.w600,
                fontSize: 32.sp,
                color: darkGreeTextColor,
              ),
              textAlign: TextAlign.center,
            ),
              SizedBox(height: 20.h),
           
             const IntroText(
              index: 0,
            ).animate().fade(delay: const Duration(seconds: 1)),
            const IntroText(
              index: 1,
            ).animate().fade(delay: const Duration(seconds: 2)),
            const IntroText(
              index: 2,
            ).animate().fade(delay: const Duration(seconds: 3)),
            const IntroText(
              index: 3,
            ).animate().fade(delay: const Duration(seconds: 4)),
            const Spacer(),
            const GetStartedButton().animate().fade(
                delay: const Duration(seconds: 5),  ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

class IntroText extends StatelessWidget {
  const IntroText({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.only(bottom: 12,left:16,right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/fi_check.svg',height: 16.h,),
            SizedBox(
            width: 4.w,
          ),
          Text(
            introTexts[index],
            style:   TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,color: const Color(0xff1F2937)),
          ),
        ],
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'button',
      child: AppButton(title:'GetStarted',onPressed:()=>  Get.toNamed(Routes.PROFILE_SETUP),icon:SvgPicture.asset('assets/svg/rocket-launch.svg',
              height: 24, width: 24),),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key, required this.title, this.onPressed,   this.icon, this.color, this.btnTextColor,
  });
  final Widget? icon;
final String title;
final Function()? onPressed;
final Color? color;
final Color? btnTextColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.black,  offset: Offset(0.0, 3.0),),
      ], borderRadius: BorderRadius.circular(16), ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child:icon==null?ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: darkGreeTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        
        onPressed: onPressed,
        child:   Text(title, style: TextStyle(color: Colors.white)),
      ): ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor:color?? darkGreeTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        icon:icon?? SvgPicture.asset('assets/svg/rocket-launch.svg',
            height: 24.r, width: 24.r),
        onPressed:onPressed,
        label:   Text(title, style: TextStyle(color:btnTextColor?? Colors.white,fontSize: 16.sp)),
      ),
    );
  }
}
