import 'package:auto_size_text/auto_size_text.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../application/ui/utils/regex_utils.dart';

class DescriptionSkinDetail extends StatelessWidget {
  final String title;
  final String description;
  final double fontSizeTitle;
  final bool containerOrRow;

  const DescriptionSkinDetail({
    super.key,
    required this.title,
    required this.description,
    this.fontSizeTitle = 20,
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
                style: context.textStyles.textTile.copyWith(
                  fontSize: fontSizeTitle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                RegexUtils.descriptionRegex(
                  description: description,
                ),
                style: context.textStyles.textMedium.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          )
        : Row(
            children: [
              AutoSizeText(
                RegexUtils.descriptionRegex(description: title),
                style: context.textStyles.textTile.copyWith(
                  fontSize: fontSizeTitle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              AutoSizeText(
                RegexUtils.descriptionRegex(description: description),
                style: context.textStyles.textMedium.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          );
  }
}
