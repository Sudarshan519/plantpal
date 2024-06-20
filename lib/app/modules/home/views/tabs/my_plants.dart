import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/features/auth/presentation/auth_controller.dart';
import 'package:plantpal/app/features/plant/data/model/plant.dart';
import 'package:plantpal/app/features/plant/presentation/plant_controller.dart';
import 'package:plantpal/app/modules/home/controllers/home_controller.dart';
import 'package:plantpal/app/modules/home/views/home_view.dart';
import 'package:plantpal/app/modules/home/views/widgets/custom_button.dart';
import 'package:plantpal/app/routes/app_pages.dart';

class MyPlant extends StatelessWidget {
  const MyPlant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final PlantController controller = Get.find();
        await controller.loadPlants();
      },
      child: SingleChildScrollView(
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
                  const MyPlants()
                ],
              ),
            ),
          ],
        ),
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
        SizedBox(height: 20.h),
        controller.obx(
          (plants) => plants?.isEmpty == true
              ? const EmptyPlantsWidget()
              : PlantLists(plants: plants ?? []),
          onError: (error) => Text(error ?? ''),
        ),
      ],
    );
  }
}

class PlantLists extends StatelessWidget {
  const PlantLists({
    super.key,
    required this.plants,
  });
  final List<PlantModel> plants;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: plants.length,
        itemBuilder: (_, i) => RPadding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: PlantComponent(plantModel: plants[i]),
            ));
  }
}

class EmptyPlantsWidget extends StatelessWidget {
  const EmptyPlantsWidget({
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
                    onPressed: () {
                      Get.find<HomeController>().selectedNav = 2;
                    },
                  ),
                  CustomButton(
                    label: 'Add Plant',
                    onPressed: () {
                      Get.toNamed(Routes.ADD_PLANT);
                    },
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
