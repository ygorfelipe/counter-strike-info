import 'package:auto_size_text/auto_size_text.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/application/ui/utils/regex_utils.dart';
import 'package:flutter/material.dart';

class DescriptionAgentDetail extends StatelessWidget {
  final String title;
  final String description;
  final bool containerOrRow;
  const DescriptionAgentDetail({
    super.key,
    required this.title,
    required this.description,
    required this.containerOrRow,
  });

  @override
  Widget build(BuildContext context) {
    return (containerOrRow != true)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                RegexUtils.descriptionRegex(description: title),
                style: context.textStyles.textTile.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                RegexUtils.descriptionRegex(description: description),
                style: context.textStyles.textMedium,
              ),
            ],
          )
        : Row(
            children: [
              AutoSizeText(
                RegexUtils.descriptionRegex(description: title),
                style: context.textStyles.textTile.copyWith(fontSize: 20),
              ),
              const SizedBox(
                width: 5,
              ),
              AutoSizeText(
                RegexUtils.descriptionRegex(description: description),
                style: context.textStyles.textMedium,
              ),
            ],
          );
  }
}
