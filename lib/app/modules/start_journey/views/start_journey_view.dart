import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:plantpal/app/modules/intro/views/intro_view.dart';
import 'package:plantpal/app/modules/profile_setup/views/profile_setup_view.dart';
import 'package:plantpal/app/routes/app_pages.dart';

import '../controllers/start_journey_controller.dart';

class StartJourneyView extends GetView<StartJourneyController> {
  const StartJourneyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  ProfileProgress(
              progress: 1,
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
           Expanded(child: TopPriorityField()),
             Hero(tag: 'button',
              child: AppButton(
                  title: 'Next',
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                   
                  },
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

