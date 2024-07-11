import 'package:cs2_info/app/features/skin/pages/home/controller/skin_bloc.dart';
import 'package:cs2_info/app/repositories/skin/skin_repository.dart';
import 'package:cs2_info/app/repositories/skin/skin_repository_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'pages/home/skin_home.dart';

sealed class SkinRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider<SkinRepository>(
            create: (context) => SkinRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => SkinBloc(
              context.read(),
              context.read(),
            ),
          ),
        ],
        child: const SkinHome(),
      );
}
