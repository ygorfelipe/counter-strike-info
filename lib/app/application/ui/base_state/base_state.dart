import 'package:cs2_info/app/application/ui/helpers/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/messages.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, Messages {
  late final C controller;

  @override
  void initState() {
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onReady();
    });
    super.initState();
  }

  void onReady() {}
}
