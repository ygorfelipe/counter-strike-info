import 'package:card_swiper/card_swiper.dart';
import 'package:cs2_info/app/application/ui/helpers/debouncer.dart';
import 'package:cs2_info/app/application/ui/styles/colors_app.dart';
import 'package:cs2_info/app/features/agent/pages/home/controller/agent_bloc.dart';
import 'package:cs2_info/app/features/agent/pages/home/controller/agent_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/ui/base_state/base_state.dart';

import '../../../../application/ui/widgets/cs2_search.dart';
import 'widgets/agent_detail_tile.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({super.key});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends BaseState<AgentPage, AgentBloc> {
  final _filterNameEC = TextEditingController();
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void onReady() {
    controller.loadAgents();
    super.onReady();
  }

  @override
  void dispose() {
    _filterNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AgentBloc, AgentState>(
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
          body: Container(
            color: ColorsApp.i.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CS2Search(
                  visilibity: true,
                  controller: _filterNameEC,
                  onClearPressed: () {
                    _filterNameEC.clear();
                    debouncer.call(() {
                      controller.filterAgent('');
                    });
                  },
                  valueChanged: (value) {
                    debouncer.call(() {
                      controller.filterAgent(value);
                    });
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Swiper(
                      itemCount: state.agents.length,
                      viewportFraction: 0.4,
                      scale: .10,
                      scrollDirection: Axis.vertical,
                      curve: Curves.easeIn,
                      autoplay: _filterNameEC.text.isEmpty ? true : false,
                      onTap: (index) async {
                        final agent = state.agents[index];

                        //* ROTA COM PARAMETRO, JOGANDO PARA AGENT_DETAIL
                        await Navigator.of(context).pushNamed(
                          '/agent-detail',
                          arguments: {'agent': agent},
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final data = state.agents[index];
                        final color = data.rarity.color;
                        return AgentDetailTile(
                          color: color,
                          agent: data,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
