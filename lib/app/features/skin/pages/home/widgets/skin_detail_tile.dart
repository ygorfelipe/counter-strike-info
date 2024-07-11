import 'package:auto_size_text/auto_size_text.dart';
import 'package:cs2_info/app/application/ui/styles/colors_app.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/application/ui/utils/regex_utils.dart';
import 'package:cs2_info/app/models/skin/skin_model.dart';
import 'package:flutter/material.dart';

class SkinDetailTile extends StatelessWidget {
  final String color;
  final SkinModel skin;

  const SkinDetailTile({
    super.key,
    required this.color,
    required this.skin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.i.backgroundCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              skin.image ?? '',
              fit: BoxFit.contain,
            ),
          ),
          ListTile(
            title: AutoSizeText(
              RegexUtils.nameRegex(
                name: skin.name,
              ),
              style: context.textStyles.textTile.copyWith(fontSize: 20),
            ),
            subtitle: AutoSizeText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.textSemiBold
                  .copyWith(color: Colors.white70),
              RegexUtils.descriptionRegex(description: skin.description),
            ),
          ),
        ],
      ),
    );
  }
}
