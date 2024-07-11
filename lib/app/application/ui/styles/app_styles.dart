import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();
  static AppStyles get i => _instance ??= AppStyles._();

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        backgroundColor: ColorsApp.i.dark,
        foregroundColor: Colors.white,
        textStyle: TextStyles.i.textButtonLabel,
      );
}

extension AppStylesExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.i;
}
