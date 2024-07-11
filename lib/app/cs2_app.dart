import 'package:cs2_info/app/application/provider/application_binding.dart';
import 'package:cs2_info/app/application/ui/theme/theme_config.dart';
import 'package:cs2_info/app/features/agent/pages/agent_detail/agent_detail_router.dart';
import 'package:cs2_info/app/features/skin/pages/skin_detail/skin_detail_router.dart';
import 'package:flutter/material.dart';

import 'features/agent/agent_router.dart';
import 'features/home/home_router.dart';
import 'features/skin/skin_router.dart';
import 'features/splash/splash_router.dart';

class Cs2App extends StatelessWidget {
  const Cs2App({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CS2 - INFO',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => SplashRouter.page,
          '/home': (context) => HomeRouter.page,
          '/agent': (context) => AgentRouter.page,
          '/agent-detail': (context) => AgentDetailRouter.page,
          '/skin': (context) => SkinRouter.page,
          '/skin-detail': (context) => SkinDetailRouter.page,
        },
      ),
    );
  }
}
