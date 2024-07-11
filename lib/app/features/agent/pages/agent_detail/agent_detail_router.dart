import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'agent_detail_page.dart';

sealed class AgentDetailRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (_) => Object(),
          )
        ],
        //* roda com parametros
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return AgentDetailPage(agent: args['agent']);
        },
      );
}
