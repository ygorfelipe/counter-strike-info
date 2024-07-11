// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cs2_info/app/application/logger/i_logger.dart';
import 'package:cs2_info/app/application/rest_client/custom_dio.dart';
import 'package:cs2_info/app/repositories/agent/agent_repository.dart';
import 'package:cs2_info/app/repositories/agent/agent_repository_impl.dart';
import 'package:cs2_info/app/repositories/country_code/country_code_repository_impl.dart';
import 'package:cs2_info/app/repositories/skin/skin_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/country_code/country_code_repository.dart';
import '../../repositories/skin/skin_repository.dart';
import '../logger/logger_impl.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => CustomDio()),
        Provider<ILogger>(
          create: (context) => LoggerImpl(),
        ),
        Provider<CountryCodeRepository>(
          create: (context) => CountryCodeRepositoryImpl(
            dio: context.read(),
            logger: context.read(),
          ),
        ),
        Provider<AgentRepository>(
          create: (context) => AgentRepositoryImpl(dio: context.read()),
        ),
        Provider<SkinRepository>(
          create: (context) => SkinRepositoryImpl(dio: context.read()),
        )
      ],
      child: child,
    );
  }
}
