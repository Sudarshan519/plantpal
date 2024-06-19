import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Image.asset('assets/Frame 6.png'),
              // Container(color: Colors.white.withOpacity(.9),)
          //  ,
              Container(
                height: 256.h,
                color: splashColor,
              ),
             
              Positioned(
                  left: 80,
                  child: Container(
                      width: Get.width,
                      height: 333,
                      child: SvgPicture.asset(
                        'assets/svg/pana-full.svg',
                        fit: BoxFit.contain,
                        width: Get.width,
                        height: 333,
                      ))),
            ],
          ),
          Transform.translate(
            offset: const Offset(0, -140),
            child: SingleChildScrollView(
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning,",
                            style: TextStyle(color: const Color(0xffC0E9C4),fontWeight: FontWeight.w500,fontSize: 14),
                          ),
                          Text("Ranjit Shrestha",style: GoogleFonts.ebGaramond(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 24),),
                        ],
                      ),
                      const CircleAvatar(
                          backgroundColor: Color.fromRGBO(64, 146, 74,1),
                          radius: 24,
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  SizedBox(height: 24.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Today's facts", style: TextStyle(color: const Color(0xffC0E9C4),fontWeight: FontWeight.w500,fontSize: 14),),
                    SizedBox(height: 8.h,),  Container(
                       height: 139.h,
                      
                      child: ListView(scrollDirection: Axis.horizontal,
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          Container(
                              height: 139.h,
                              width: 300,
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [const BoxShadow(color: Colors.grey)],
                                  border: Border.all(color: Colors.grey.shade200)),
                                  child:Row(children: [ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network('https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'))],)
                            ),
                             Container(
                              height: 139.h,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [const BoxShadow(color: Colors.grey)],
                                  border: Border.all(color: Colors.grey.shade200)),
                                  child:Row(children: [Image.network('https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')],)
                            ),
                        ],
                      ),
                    ),
                      const Text("My Plants"),
                      Center(
                        child: SvgPicture.asset(
                          'assets/svg/rafiki.svg',
                          height: 154.h,
                          width: 114.h,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        child: const Row(
          children: [],
        ),
      ),
    );
  }
}
