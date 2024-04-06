import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppThemes {
  static final appTheme = ThemeData(
    textTheme: GoogleFonts.getTextTheme(
        "Manrope",
        TextTheme(
          displayLarge: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 34.sp,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        )),
  );
}
