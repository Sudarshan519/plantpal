import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/modules/profile_setup/controllers/profile_setup_controller.dart';

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
                            Get.find<AuthController>()
                                .selectedFeature(feature.label);
                          },
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200, blurRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Row(
                              children: [
                                Image.asset(feature.image, height: 24.h),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Text(feature.label,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff464646))),
                                const Spacer(),
                                Checkbox(
                                  activeColor: darkGreeTextColor,
                                  value: Get.find<AuthController>()
                                          .selectedFeature
                                          .value
                                          .isEmpty
                                      ? false
                                      : Get.find<AuthController>()
                                              .selectedFeature
                                              .value ==
                                          feature.label,
                                  onChanged: (onChanged) {
                                    Get.find<AuthController>()
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
