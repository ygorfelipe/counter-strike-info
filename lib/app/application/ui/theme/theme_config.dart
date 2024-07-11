import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

sealed class ThemeConfig {
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7.0),
    borderSide: BorderSide(
      color: Colors.grey[400]!,
    ),
  );
  static final theme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.i.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.i.backgroundColor,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
      secondary: ColorsApp.i.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.i.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorsApp.i.dark,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13.0),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.i.textRegular.copyWith(color: Colors.black),
      errorStyle: TextStyles.i.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}
