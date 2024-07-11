import 'package:cs2_info/app/features/agent/pages/home/agent_page.dart';
import 'package:cs2_info/app/features/agent/pages/home/controller/agent_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

sealed class AgentRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => AgentBloc(
              context.read(),
              context.read(),
            ),
          ),
        ],
        child: const AgentPage(),
      );
}
