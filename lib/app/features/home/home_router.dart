import 'package:cs2_info/app/features/home/controller/home_bloc.dart';
import 'package:cs2_info/app/features/home/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

sealed class HomeRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => HomeBloc(
              context.read(),
              context.read(),
            ),
          ),
        
        ],
        child: const HomePage(),
      );
}
