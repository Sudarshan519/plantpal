import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/modules/intro/views/intro_view.dart';
import 'package:plantpal/app/modules/start_journey/views/top_priority.dart';
import 'package:plantpal/app/routes/app_pages.dart';

import '../controllers/profile_setup_controller.dart';

class ProfileSetupView extends GetView<ProfileSetupController> {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final PageController pageController = PageController();
    final name = TextEditingController();
    final fields = [
      Form(key: formKey, child: NameFormField(name: name)),
      const TopPriorityField(),
      const CreateAccountWidget(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              () => controller.count >= 2
                  ? AnimatedPadding(
                      duration: 600.milliseconds,
                      padding: const EdgeInsets.only(bottom: 30),
                      child: AppButton(
                        color: creatAccountBtnColor,
                        icon: SvgPicture.asset(
                            'assets/svg/social media logo.svg'),
                        title: 'Create with Google',
                        onPressed: () {},
                      ),
                    )
                  : Hero(
                      tag: 'button',
                      child: AppButton(
                        title: 'Next',
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            Get.toNamed(Routes.START_JOURNEY);
                          }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
        ),
        SvgPicture.asset('assets/svg/pana.svg'),
      ],
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
            onFieldSubmitted: (name) {
              Get.find<AuthController>().username(name);
            },
            style: GoogleFonts.ebGaramond(
                fontSize: 24, fontWeight: FontWeight.w500),
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
