import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppAppBarTheme {
  AppAppBarTheme._();
  static const mAppBarTheme = AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17));
}
