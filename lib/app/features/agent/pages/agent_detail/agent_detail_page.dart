// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/application/ui/widgets/cs2_search.dart';
import 'package:cs2_info/app/models/agent/agent_model.dart';
import 'package:flutter/material.dart';

import '../../../../application/ui/styles/colors_app.dart';
import '../../../../application/ui/utils/regex_utils.dart';
import '../home/widgets/description_detail_agente.dart';

class AgentDetailPage extends StatelessWidget {
  final AgentModel agent;
  const AgentDetailPage({
    super.key,
    required this.agent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(0.5),
            color: RegexUtils.colorRegex(color: agent.rarity.color),
            child: Image.network(
              agent.image,
              fit: BoxFit.contain,
            ),
          ),
          const CS2Search(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.percentHeight(0.6),
              decoration: BoxDecoration(
                color: ColorsApp.i.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: AutoSizeText(
                          RegexUtils.descriptionRegex(description: agent.name),
                          style: context.textStyles.textTile
                              .copyWith(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DescriptionAgentDetail(
                        containerOrRow: true,
                        title: 'Raridade:',
                        description: agent.rarity.name,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DescriptionAgentDetail(
                        containerOrRow: true,
                        title: 'Coleção:',
                        description: agent.collections.first.name ?? '',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DescriptionAgentDetail(
                        containerOrRow: true,
                        title: 'Team:',
                        description: agent.teamModel.name ?? '',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DescriptionAgentDetail(
                        containerOrRow: false,
                        title: 'Descrição ',
                        description: agent.description,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
