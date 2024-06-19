import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/app/core/constants.dart';
import 'package:plantpal/app/modules/intro/views/intro_view.dart';
import '../controllers/add_plant_controller.dart';

class AddPlantView extends GetView<AddPlantController> {
  const AddPlantView({super.key});
  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final description = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Plant'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithLabel(
              label: 'Plant Name',
              controller: name,
              onChanged: (plantname) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFieldWithLabel(
              label: 'Description',
              controller: description,
              onChanged: (plantname) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            LabelWithChild(
              label: "Plant Image",
              child: SizedBox(
                height: 40,
                child: AppButton(
                  color: Colors.grey,
                  title: 'Pick Image',
                  onPressed: () async {
                    controller.uploadImage();
                  },
                ),
              ),
            ),
            Obx(
              () => controller.selectedImage.value == ''
                  ? const SizedBox()
                  : controller.image_uploading.value
                      ? const CircularProgressIndicator()
                      : Image.network(
                          controller.selectedImage.value,
                          height: 300,
                        ),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppButton(
              title: "Upload Plant",
              onPressed: () {
                controller.uploadPlant(
                  name.text,
                  description.text,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel(
      {super.key,
      required this.label,
      required this.controller,
      required this.onChanged});
  final String label;
  final TextEditingController controller;
  final Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.ebGaramond(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: darkGreeTextColor),
        ),
        TextFormField(
          controller: controller,
          validator: (String? name) {
            if (name?.isEmpty != true) {
              return null;
            } else {
              return '* Required';
            }
          },
          onFieldSubmitted: (name) {},
          style: GoogleFonts.ebGaramond(
              fontSize: 18.sp, fontWeight: FontWeight.w500),
          decoration: const InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: splashColor))),
        ),
      ],
    );
  }
}

class LabelWithChild extends StatelessWidget {
  const LabelWithChild({super.key, required this.label, required this.child});
  final String label;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: GoogleFonts.ebGaramond(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: darkGreeTextColor),
      ),
      child
    ]);
  }
}
