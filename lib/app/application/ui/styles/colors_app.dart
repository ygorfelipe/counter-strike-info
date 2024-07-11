import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFFf3fafa);
  Color get secondary => const Color(0xFF369695);
  Color get dark => const Color(0xFF0d2426);
  Color get backgroundColor => const Color(0xFF0d2426);
  Color get selectedColor => const Color(0xFF0d2426);
  Color get backgroundButton => const Color(0xFF214c4e);
  Color get backgroundCard => const Color(0xFF2a7577);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
