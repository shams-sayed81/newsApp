import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/colors_manager.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.secondary,
    colorScheme: ColorScheme.light(
        primary: ColorsManager.primary,
    secondary: ColorsManager.secondary),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.secondary,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: ColorsManager.primary,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.primary,

      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.tertiary,

      ),

      bodySmall:TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.secondary,

      ) ,

      headlineLarge:TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.primary,

      ),

    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.secondary),
      ))
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.primary,

    colorScheme: ColorScheme.dark(
        primary: ColorsManager.secondary ,
        secondary: ColorsManager.primary),
    appBarTheme: AppBarTheme(
      backgroundColor:ColorsManager.primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: ColorsManager.secondary,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500),
    ),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.secondary
          ),
        headlineLarge:TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.secondary,

        ),

        bodySmall:TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.primary,

        ) ,
        titleSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.tertiary,

        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: ColorsManager.secondary),
          ),),
  );
}
