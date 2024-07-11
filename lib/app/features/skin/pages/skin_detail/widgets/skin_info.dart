import 'package:auto_size_text/auto_size_text.dart';
import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/application/ui/utils/regex_utils.dart';
import 'package:cs2_info/app/models/skin/skin_model.dart';
import 'package:flutter/material.dart';

import '../../../../../application/ui/styles/colors_app.dart';
import '../../home/widgets/description_skin_detail.dart';

class SkinInfo extends StatelessWidget {
  final SkinModel skin;

  const SkinInfo({super.key, required this.skin});

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
        child: SingleChildScrollView(
          controller: scrollController,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 12.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              RegexUtils.descriptionRegex(
                                description: skin.name,
                              ),
                              style: context.textStyles.textTile.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            AutoSizeText(
                              skin.stattrak != false ? '(★ StatTrak™)' : '',
                              style: context.textStyles.textTile.copyWith(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.percentHeight(.06),
                        child: ListView.builder(
                          itemCount: skin.wears?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final wear = skin.wears?[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                                top: 10.0,
                                right: 5.0,
                              ),
                              child: ChoiceChip(
                                selected: true,
                                checkmarkColor: ColorsApp.i.secondary,
                                selectedColor: ColorsApp.i.backgroundButton,
                                backgroundColor: ColorsApp.i.dark,
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                label: Text(
                                  wear?.name ?? '',
                                  style: context.textStyles.textRegular
                                      .copyWith(fontSize: 12.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      skin.collections!.isNotEmpty
                          ? SizedBox(
                              width: context.screenWidth,
                              height: context.percentHeight(.04),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      RegexUtils.descriptionRegex(
                                          description:
                                              skin.collections?.first.name),
                                      style:
                                          context.textStyles.textTile.copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Image.network(
                                      '${skin.collections?.first.image}'),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 12,
                      ),
                      DescriptionSkinDetail(
                        containerOrRow: true,
                        title: 'Categoria:',
                        fontSizeTitle: 14,
                        description: skin.category?.name ?? '',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DescriptionSkinDetail(
                            containerOrRow: true,
                            title: 'Min. Float:',
                            description: '${skin.minFloat}',
                            fontSizeTitle: 14,
                          ),
                          DescriptionSkinDetail(
                            containerOrRow: true,
                            title: 'Max. Float:',
                            description: '${skin.maxFloat}',
                            fontSizeTitle: 14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DescriptionSkinDetail(
                        containerOrRow: true,
                        title: 'Team:',
                        description: skin.team?.name ?? '',
                        fontSizeTitle: 14,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      DescriptionSkinDetail(
                        containerOrRow: false,
                        title: skin.rarity?.name ?? '',
                        description: skin.description ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
