import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'skin_detail_page.dart';

sealed class SkinDetailRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (_) => Object(),
          ),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return SkinDetailPage(skin: args['skin']);
        },
      );
}
