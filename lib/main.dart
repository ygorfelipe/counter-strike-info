import 'package:flutter/material.dart';

import 'app/application/config/env/env.dart';
import 'app/cs2_app.dart';

void main() async {
  await Env.i.load();
  runApp(const Cs2App());
}
