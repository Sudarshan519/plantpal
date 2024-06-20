import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/features/plant/data/model/plant.dart';
import 'package:plantpal/app/modules/home/views/tabs/community.dart';
import 'package:plantpal/app/modules/home/views/tabs/my_plants.dart';
import 'package:plantpal/app/modules/home/views/tabs/nursery.dart';
import 'package:plantpal/app/modules/home/views/tabs/profile.dart';
import 'package:plantpal/app/modules/home/views/widgets/nav_item.dart';
import 'package:plantpal/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    /// nav
    Widget bottomNav() => Container(
          padding: REdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
              boxShadow: const [
                BoxShadow(offset: Offset(1, 0), color: Colors.grey)
              ]),
          child: SizedBox(
            height: 64,
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavItem(
                    icon: 'assets/nav_icons/Home.svg',
                    label: "My Plants",
                    isSelected: controller.selectedNav == 0,
                    onPressed: () => controller.selectedNav = 0,
                  ),
                  NavItem(
                    icon: 'assets/nav_icons/Diary.svg',
                    label: "Community",
                    isSelected: controller.selectedNav == 1,
                    onPressed: () => controller.selectedNav = 1,
                  ),
                  NavItem(
                    icon: 'assets/nav_icons/Chart.svg',
                    label: "Nursery",
                    isSelected: controller.selectedNav == 2,
                    onPressed: () => controller.selectedNav = 2,
                  ),
                  NavItem(
                    icon: 'assets/nav_icons/Settings.svg',
                    label: "Profile",
                    isSelected: controller.selectedNav == 3,
                    onPressed: () => controller.selectedNav = 3,
                  ),
                ],
              ),
            ),
          ),
        );

    /// pages
    var pages = [
      const MyPlant(),
      const Community(),
      const Nursery(),
      const Profile(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: false,
      body: Obx(() => pages[controller.selectedNav]),
      bottomNavigationBar: bottomNav(),
      floatingActionButton: const FloatingActionWidget(),
    );
  }
}

class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(Routes.ADD_PLANT);
      },
      backgroundColor: splashColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 38.r,
      ),
    );
  }
}

class TodaysFact extends StatelessWidget {
  const TodaysFact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Today's facts",
            style: TextStyle(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 139.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: REdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, i) => PlantComponent(
              plantModel: plantModels[0],
            ),
          ),
        ),
      ],
    );
  }
}

class BackroundImage extends StatelessWidget {
  const BackroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Frame 6.png',
      height: 256.h,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

class PlantComponent extends StatelessWidget {
  const PlantComponent({
    super.key,
    required this.plantModel,
  });
  final PlantModel plantModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 139.h,
        width: 380.w,
        padding: REdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.grey)],
            border: Border.all(color: Colors.grey.shade200)),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  plantModel.image ??
                      'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  errorBuilder: (_, error, stack) => Image.network(
                    'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ),
                  width: 114.w,
                  height: 107.h,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plantModel.name ?? "",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      )),
                  Text(
                    plantModel.description ??
                        "A plant with beautiful petal but protected with throne. Smell amazing with health benefit.....",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff1F2937),
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: 4.h),
                  Spacer(),
                  Row(
                    children: [
                      Text("Continue Reading",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: splashColor,
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 8,
                        color: splashColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
