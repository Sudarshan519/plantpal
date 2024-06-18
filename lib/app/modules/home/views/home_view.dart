import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:plantpal/app/core/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(children: [
      Stack(
        children: [
          Container(height: 256,color: darkGreeTextColor,),
          Positioned(
            left: 80,
            child: Container(
            width: Get.width,height: 333,
            child: SvgPicture.asset('assets/svg/pana-full.svg',fit: BoxFit.contain,width: Get.width,height: 333,))),
            
        ],
      ),Transform.translate(offset: Offset(0,-180),
              child: Column(children: [
                Text("Good Morning,"),
                Text("Ranjit Shrestha"),
                Column(children: [Text("Today's facts"),
                Container(height: 300,width: 300,color: Colors.white,),
                Text("My Plants"),
                SvgPicture.asset('assets/svg/rafiki.svg',height: 300,width: 200,),
                ],)
              ],),
            ),
    ],),
    floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
    bottomNavigationBar: Container(child: Row(children: [],),),
    );
  }
}
