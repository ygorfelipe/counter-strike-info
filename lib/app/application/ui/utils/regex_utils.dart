import 'package:flutter/material.dart';

sealed class RegexUtils {
  static String descriptionRegex({required String? description}) {
    if (description != null) {
      final text = description.replaceAll(RegExp(r'\\n'), '');
      final result = text.replaceAll(RegExp(r'\\|\\n|<i>|<\/i>'), '');

      return result;
    }
    return '';
  }

  static Color colorRegex({required String color}) {
    final result = color.replaceAll(RegExp(r'#'), '0xFF');
    return Color(int.parse(result));
  }

  static String nameRegex({required String? name}) {
    if (name != null) {
      final result = name.replaceAll(r'\', '');

      return result;
    }
    return '';
  }
}
