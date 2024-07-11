import 'package:cs2_info/app/application/ui/base_state/base_state.dart';
import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/widgets/cs2_button.dart';
import 'package:cs2_info/app/features/splash/controller/splash_bloc.dart';
import 'package:cs2_info/app/models/country_codes/country_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/constants/constants.dart';
import 'controller/splash_state.dart';
import 'widgets/countires_type_field.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc>
    with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  String? checkValidId;

  final checkTypeValid = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        //! só esta com essa função e chamada na controle pois foi feito uma busca via api
        //! porém como na api do cs não tem todos os idiomas fiz uma lista estatica mesmo para poder trabalhar
        //! caso a api desse suporte a todos os idiomas já estaria correto.
        state.status.matchAny(
          any: () => hideLoader(),
          success: () {
            hideLoader();
            Navigator.of(context).pushNamed('/home');
          },
        );
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/cs2_logo.png',
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: context.percentHeight(0.2)),
                    child: BlocSelector<SplashBloc, SplashState,
                        List<CountryModel>>(
                      selector: (state) => state.countries,
                      builder: (context, countries) {
                        return Container(
                          // height: context.percentHeight(.06),
                          // width: 200,
                          color: Colors.white10,
                          alignment: Alignment.center,
                          child: ValueListenableBuilder(
                            valueListenable: checkTypeValid,
                            builder: (_, checkValid, child) {
                              return CountiresTypeField(
                                countrieType: CountryModel.languages,
                                valueChanged: (value) async {
                                  checkValidId = value;
                                },
                                valid: checkValid,
                                valueSelected: checkValidId.toString(),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: DeliveryButton(
                      label: 'Acessar',
                      onPressed: () async {
                        final valid = formKey.currentState?.validate() ?? false;
                        final languageSelected = checkValidId != null;
                        checkTypeValid.value = languageSelected;

                        if (valid && languageSelected) {
                          final navigate = Navigator.of(context);
                          final sp = await SharedPreferences.getInstance();
                          await sp.setString(Constants.language, checkValidId!);
                          navigate.pushReplacementNamed('/home');
                        } else {
                          showInfo('Selecione um idioma');
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pushNamed('/test'),
                      child: const Text('Page Test'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
