import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/modules/intro/views/intro_view.dart';
import 'package:plantpal/app/routes/app_pages.dart';

import '../controllers/profile_setup_controller.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({super.key});
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final name = TextEditingController();
    final fields = [
      NameFormField(name: name),
      const TopPriorityField(),
      const CreateAccountWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => ProfileProgress(
              progress: controller.count,
            )),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (page) {
                      controller.count = page;
                    },
                    itemBuilder: (_, i) => fields[i])),
            Obx(
             ()=>
              controller.count>=2?  AnimatedPadding(
                duration: 600.milliseconds,
                padding: EdgeInsets.only(bottom: 30),
                child: AppButton(
                  color:creatAccountBtnColor,
                  icon: SvgPicture.asset('assets/svg/social media logo.svg'),
                  title: 'Create with Google',
                  onPressed: () {
                    // controller.increment();
                    // if (controller.count <= 2) {
                    //   pageController.nextPage(
                    //       duration: 1.seconds, curve: Curves.ease);
                    // }
                  },
                ),
              ):
             Hero(tag: 'button',
               child: AppButton(
                  title: 'Next',
                  onPressed: () {
                    Get.toNamed(Routes.START_JOURNEY);
                    // controller.increment();
                    // if (controller.count <= 2) {
                    //   pageController.nextPage(
                    //       duration: 1.seconds, curve: Curves.ease);
                    // }
                  },
                ),
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

class CreateAccountWidget extends StatelessWidget {
  const CreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
            'Create Account',
            style: GoogleFonts.ebGaramond(
                fontWeight: FontWeight.w600,
                fontSize: 32.spMin,
                color: darkGreeTextColor),
          ),
      ),
        Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Done! Register your account to save your data. ",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),SvgPicture.asset('assets/svg/pana.svg'),],
    );
  }
}

class TopPriorityField extends StatelessWidget {
  const TopPriorityField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Priority',
            style: GoogleFonts.ebGaramond(
                fontWeight: FontWeight.w600,
                fontSize: 32.spMin,
                color: darkGreeTextColor),
          ),
          Text(
            "Choose the feature that is most essential for you.",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Column(
            children: featues
                .map((feature) => Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: () {
                            Get.find<ProfileSetupController>()
                                .selectedFeature(feature.label);
                          },
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200, blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.grey.shade200)),
                            child: Row(
                              children: [
                                Image.asset(feature.image, height: 24.h),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Text(feature.label),
                                const Spacer(),
                                Checkbox(
                                  activeColor: darkGreeTextColor,
                                  value: Get.find<ProfileSetupController>()
                                          .selectedFeature
                                          .value
                                          .isEmpty
                                      ? false
                                      : Get.find<ProfileSetupController>()
                                              .selectedFeature
                                              .value ==
                                          feature.label,
                                  onChanged: (onChanged) {
                                    Get.find<ProfileSetupController>()
                                        .selectedFeature(feature.label);
                                  },
                                  side: const BorderSide(width: .5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(width: 0.5)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required this.name,
  });

  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: GoogleFonts.ebGaramond(
                fontWeight: FontWeight.w600,
                fontSize: 32.spMin,
                color: darkGreeTextColor),
          ),
          TextFormField(
            controller: name,
            validator: (String? name) {
              if (name?.isEmpty != true) {
                return null;
              } else {
                return '* Required';
              }
            },
            style:
                GoogleFonts.ebGaramond(fontSize: 24, fontWeight: FontWeight.w500),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: splashColor))),
          ),
        ],
      ),
    );
  }
}

class ProfileProgress extends StatelessWidget {
  const ProfileProgress({
    super.key,
    required this.progress,
  });
  final int progress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          width: 32,
          height: 6,
          decoration: BoxDecoration(
              color: progress >= 0
                  ? const Color(0xff40924A)
                  : const Color(0xffD2F5D6),
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          margin: const EdgeInsets.only(right: 12),
          width: 32,
          height: 6,
          decoration: BoxDecoration(
              color: progress >= 1
                  ? const Color(0xff40924A)
                  : const Color(0xffD2F5D6),
              borderRadius: BorderRadius.circular(8)),
        ),
        Container(
          width: 32,
          height: 6,
          decoration: BoxDecoration(
              color: progress >= 2
                  ? const Color(0xff40924A)
                  : const Color(0xffD2F5D6),
              borderRadius: BorderRadius.circular(8)),
        ),
      ],
    );
  }
}
