import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/text_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData theme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: AppColors.primary,
      textTheme: AppTextTheme.mTextTheme,
      appBarTheme: AppAppBarTheme.mAppBarTheme);
}
