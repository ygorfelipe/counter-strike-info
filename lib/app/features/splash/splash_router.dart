import 'package:cs2_info/app/features/splash/controller/splash_bloc.dart';
import 'package:cs2_info/app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

sealed class SplashRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => SplashBloc(
              context.read(),
              context.read(),
            ),
          ),
        ],
        child: const SplashPage(),
      );
}
