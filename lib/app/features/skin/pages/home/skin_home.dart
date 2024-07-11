import 'package:card_swiper/card_swiper.dart';
import 'package:cs2_info/app/application/ui/helpers/debouncer.dart';
import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/features/skin/pages/home/controller/skin_bloc.dart';
import 'package:cs2_info/app/features/skin/pages/home/controller/skin_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/ui/base_state/base_state.dart';
import '../../../../application/ui/styles/colors_app.dart';
import '../../../../application/ui/widgets/cs2_search.dart';
import 'widgets/skin_detail_tile.dart';

class SkinHome extends StatefulWidget {
  const SkinHome({super.key});

  @override
  State<SkinHome> createState() => _SkinHomeState();
}

class _SkinHomeState extends BaseState<SkinHome, SkinBloc> {
  final _filterNameEC = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final debouncer = Debouncer(milliseconds: 900);

  int? _value = 0;
  bool isSelected = false;

  @override
  void onReady() async {
    controller.loadSkins();
    _filterNameEC.addListener(() {
      setState(() {});
    });
    super.onReady();
  }

  @override
  void dispose() {
    _filterNameEC.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  final listCategory = [
    'Facas',
    'Luvas',
    'Rifles',
    'Pistolas',
    'Pesadas',
    'Submetr.',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SkinBloc, SkinState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? 'Erro não informado');
          },
        );
      },
      buildWhen: (previous, current) => current.status.matchAny(
        any: () => false,
        initial: () => true,
        loaded: () => true,
      ),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            color: ColorsApp.i.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CS2Search(
                  controller: _filterNameEC,
                  onClearPressed: () {
                    _filterNameEC.clear();
                    debouncer.call(() {
                      controller.filterSkin('');
                    });
                  },
                  valueChanged: (value) {
                    debouncer.call(() {
                      Future.delayed(Duration.zero, () {
                        showLoader();
                      });
                      controller.filterSkin(value);
                    });
                  },
                  onSelected: (value) {
                    Future.delayed(Duration.zero, () {
                      showLoader();
                    });
                    _filterNameEC.clear();
                    controller.filterByAz(value);
                    FocusScope.of(context).unfocus();
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: SizedBox(
                    width: context.screenWidth,
                    height: context.percentHeight(.06),
                    child: ListView.builder(
                      itemCount: listCategory.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final data = listCategory[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 5.0,
                            top: 10.0,
                            right: 5.0,
                          ),
                          child: ChoiceChip(
                            checkmarkColor: ColorsApp.i.secondary,
                            selectedColor: ColorsApp.i.selectedColor,
                            backgroundColor: ColorsApp.i.backgroundButton,
                            labelStyle: const TextStyle(color: Colors.white),
                            showCheckmark: false,
                            label: Text(
                              data,
                              style: context.textStyles.textRegular,
                            ),
                            selected: _value == index,
                            onSelected: (bool selected) {
                              Future.delayed(Duration.zero, () {
                                showLoader();
                              });
                              setState(() {
                                _value = selected ? index : null;
                                debouncer.call(() {
                                  controller.filterCategory(data);
                                });
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Swiper(
                      itemCount: state.skins.length,
                      viewportFraction: 0.5,
                      scale: .10,
                      scrollDirection: Axis.vertical,
                      curve: Curves.easeIn,
                      autoplay: _filterNameEC.text.isEmpty ? true : false,
                      onTap: (index) async {
                        final skin = state.skins[index];
                        await Navigator.of(context).pushNamed(
                          '/skin-detail',
                          arguments: {'skin': skin},
                        );
                      },
                      itemBuilder: (context, index) {
                        final data = state.skins[index];
                        final color = data.rarity?.color;
                        return SkinDetailTile(
                          color: '$color',
                          skin: data,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
