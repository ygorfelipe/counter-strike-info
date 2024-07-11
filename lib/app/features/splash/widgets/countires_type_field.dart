import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';

import '../../../models/country_codes/country_model.dart';

class CountiresTypeField extends StatelessWidget {
  final List<Map<String, String>> countrieType;
  final ValueChanged<String> valueChanged;
  final bool valid;
  final String valueSelected;
  const CountiresTypeField({
    super.key,
    required this.countrieType,
    required this.valueChanged,
    required this.valid,
    required this.valueSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmartSelect<String>.single(
            title: '',
            selectedValue: valueSelected,
            modalType: S2ModalType.bottomSheet,
            onChange: (selected) {
              valueChanged(selected.value.toString());
            },
            tileBuilder: (context, state) {
              return InkWell(
                onTap: state.showModal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: context.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.selected.title ?? 'Selecione um idioma 🌐',
                            style: context.textStyles.textSemiBold.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            state.selected.subtitle ?? '',
                            style: context.textStyles.textSemiBold.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            choiceItems: S2Choice.listFrom<String, Map<String, String?>>(
              source: CountryModel.languages
                  .map(
                    (c) => {
                      'value': c['flag'],
                      'title': c['name'],
                      'emoji': c['emoji'],
                      'flag': c['flag'],
                    },
                  )
                  .toList(),
              value: (index, item) => item['flag'] ?? '',
              title: (index, item) => item['title'] ?? '',
              subtitle: (index, item) => item['emoji'] ?? '',
              group: (index, item) => 'Selecione um idioma',
            ),

            //* buscando da API
            // choiceItems: S2Choice.listFrom<String, Map<String, String>>(
            //   source: countrieType
            //       .map(
            //         (c) => {
            //           'value': c.code,
            //           'title': c.name,
            //           'emoji': c.emoji,
            //         },
            //       )
            //       .toList(),
            //   value: (index, item) => item['value'] ?? '',
            //   title: (index, item) => item['title'] ?? '',
            //   subtitle: (index, item) => item['emoji'] ?? '',
            //   group: (index, item) => 'Selecione um idioma',
            // ),

            choiceType: S2ChoiceType.radios,
            choiceGrouped: true,
            modalFilter: false,
            placeholder: '',
          ),
        ],
      ),
    );
  }
}
