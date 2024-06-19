import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/features/home/presentation/plant_controller.dart';
import 'package:plantpal/app/modules/home/views/home_view.dart';
import 'package:plantpal/app/modules/home/views/tabs/tabs.dart';

class MyPlant extends StatelessWidget {
  const MyPlant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 256.h,
            child: const BackroundImage(),
          ),
          Transform.translate(
            offset: const Offset(0, -160),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopHeader(),
                SizedBox(
                  height: 24.h,
                ),
                const TodaysFact(),
                SizedBox(height: 24.h),
                MyPlants()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good Morning,",
                style: TextStyle(
                    color: Color(0xffC0E9C4),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              Text(
                Get.find<AuthController>().username.value,
                style: GoogleFonts.ebGaramond(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp),
              ),
            ],
          ),
          const NotificationButton(),
        ],
      ),
    );
  }
}

class MyPlants extends StatelessWidget {
  const MyPlants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PlantController controller = Get.find();
    // controller.loadPlants();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "My Plants",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        controller.obx(
          (state) => state?.isEmpty == true
              ? const NoPlantsWidget()
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: state?.length,
                  itemBuilder: (_, i) => RPadding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 8),
                        child: PlantComponent(plantModel: state![i]),
                      )),
          onError: (error) => Text(error ?? ''),
        ),
      ],
    );
  }
}

class NoPlantsWidget extends StatelessWidget {
  const NoPlantsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          width: 294.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svg/rafiki.svg',
                height: 160.h,
                width: 151.w,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "No plants added yet, continue\n adding to see them here",
                style: GoogleFonts.ebGaramond(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    label: 'Visit Nursery',
                    onPressed: () {},
                  ),
                  CustomButton(
                    label: 'Add Plant',
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xff40924A),
          radius: 24,
          child: Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
        ),
        Positioned(
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 8,
              child: Text(
                '3',
                style: TextStyle(color: splashColor, fontSize: 11.sp),
              ),
            ))
      ],
    );
  }
}
