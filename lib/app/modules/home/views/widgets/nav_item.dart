import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });
  final String icon;
  final String label;
  final bool isSelected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 94.w,
        padding: const EdgeInsets.all(8),
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffECF8EC))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            Text(
              label,
              style: GoogleFonts.inter(
                  fontSize: 12.sp, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
