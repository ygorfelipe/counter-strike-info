import 'package:auto_size_text/auto_size_text.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/models/agent/agent_model.dart';
import 'package:flutter/material.dart';

import '../../../../../application/ui/styles/colors_app.dart';
import '../../../../../application/ui/utils/regex_utils.dart';

class AgentDetailTile extends StatelessWidget {
  final String color;
  final AgentModel agent;

  const AgentDetailTile({
    super.key,
    required this.color,
    required this.agent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color != ''
          ? RegexUtils.colorRegex(color: color)
          : ColorsApp.i.primary,
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(
                  agent.image,
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                title: AutoSizeText(
                  RegexUtils.nameRegex(
                    name: agent.name,
                  ),
                  style: context.textStyles.textTile.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                subtitle: AutoSizeText(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.textSemiBold.copyWith(
                    color: Colors.white70,
                  ),
                  RegexUtils.descriptionRegex(
                    description: agent.description,
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
