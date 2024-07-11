import 'package:cs2_info/app/application/template/menu_enum.dart';
import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/features/home/controller/home_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/ui/base_state/base_state.dart';
import '../../application/ui/styles/colors_app.dart';
import '../../application/ui/widgets/cs2_app_bar.dart';
import 'controller/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
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
          appBar: CS2AppBar(),
          body: SingleChildScrollView(
            child: Container(
              color: ColorsApp.i.backgroundColor,
              height: context.screenHeight,
              width: context.screenWidth,
              child: GridView.builder(
                itemCount: Menu.values.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  mainAxisExtent: 200.0,
                ),
                itemBuilder: (context, index) {
                  final menu = Menu.values[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(menu.route);
                    },
                    child: Container(
                      height: context.percentHeight(.2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(menu.assetImage))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.grey[700],
                            alignment: Alignment.bottomCenter,
                            width: context.screenWidth,
                            child: Text(
                              menu.name,
                              style: context.textStyles.textTile.copyWith(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  /* 
  
  
  Card(
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Card(
                            child: Image.asset(
                              menu.assetImage,
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                          ),
                          Text(
                            menu.name,
                            style: context.textStyles.textTile.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
  
  
  
  
  */

  // CustomScrollView _customScroolView() {
  //   return CustomScrollView(
  //     slivers: [
  //       //* extrair card para um enum após realizar isso, fazer a chamada aqui
  //       //* o enum tem que ser estilo o dw10 para seleção de menu
  //       SliverToBoxAdapter(
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: Card(
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/agent-cs-go.png',
  //                       fit: BoxFit.contain,
  //                     ),
  //                     const Text('Agents')
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Card(
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/skin-dragon-lore.png',
  //                       fit: BoxFit.contain,
  //                     ),
  //                     const Text('Skins')
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       SliverToBoxAdapter(
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: Card(
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/collections-box.png',
  //                       fit: BoxFit.contain,
  //                     ),
  //                     const Text('Coleções')
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Card(
  //                 child: Column(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/crates-box.png',
  //                       fit: BoxFit.contain,
  //                     ),
  //                     const Text('Caixas')
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
