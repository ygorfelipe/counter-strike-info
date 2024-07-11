import 'package:auto_size_text/auto_size_text.dart';
import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/application/ui/utils/regex_utils.dart';
import 'package:cs2_info/app/application/ui/widgets/image_preview.dart';

import 'package:cs2_info/app/models/skin/skin_model.dart';
import 'package:flutter/material.dart';

class CratesInfo extends StatelessWidget {
  final SkinModel skin;

  const CratesInfo({super.key, required this.skin});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 20),
      child: RawScrollbar(
        thumbColor: Colors.white,
        thickness: 2,
        controller: scrollController,
        thumbVisibility: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              AutoSizeText(
                skin.crates!.isNotEmpty ? 'Crates' : 'Crates not found',
                style: context.textStyles.textTile.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: skin.crates?.length ?? 0,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final crate = skin.crates?[index];
                    return Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            RegexUtils.descriptionRegex(
                              description: skin.crates!.isNotEmpty
                                  ? '${crate?.name}'
                                  : 'Crates not found',
                            ),
                            style: context.textStyles.textTile.copyWith(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ImagePreview.showPreview(
                              context,
                              name: '${crate?.name}',
                              imageUrl: '${crate?.image}',
                            );
                          },
                          child: SizedBox(
                            height: context.percentHeight(0.12),
                            child: Image.network(
                              '${crate?.image}',
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
