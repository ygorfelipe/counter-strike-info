import 'package:animations/animations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:cs2_info/app/application/ui/widgets/cs2_app_bar.dart';
import 'package:cs2_info/app/features/test/test_page_2.dart';
import 'package:flutter/material.dart';

import '../../application/ui/styles/colors_app.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final pageController = PageController(initialPage: 0);
  final textEC = TextEditingController();
  List<String> pageList = ['page1', 'page2'];

  int selectPageIndex = 0;

  final image =
      'https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_hy_ddpat_urb_light_png.png';

  @override
  void initState() {
    textEC.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CS2AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Swiper(
              itemCount: 20,
              viewportFraction: 0.5,
              scale: .10,
              scrollDirection: Axis.vertical,
              curve: Curves.easeIn,
              itemBuilder: (context, index) {
                return OpenContainer(
                  transitionDuration: const Duration(seconds: 1),
                  transitionType: _transitionType,
                  openColor: ColorsApp.i.backgroundColor,
                  middleColor: ColorsApp.i.backgroundCard,
                  closedColor: ColorsApp.i.backgroundColor,
                  openBuilder: (context, action) {
                    return TestPage2(
                      image: image,
                      title: 'Title $index',
                    );
                  },
                  closedBuilder: (context, action) {
                    return InkWell(
                      onTap: action,
                      child: Container(
                        color: ColorsApp.i.backgroundCard,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Texto',
                                style: context.textStyles.textTile
                                    .copyWith(fontSize: 20),
                              ),
                              subtitle: Text(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyles.textSemiBold
                                    .copyWith(color: Colors.white70),
                                'Tão cara quanto poderosa, a Desert Eagle é uma pistola icônica difícil de domar, mas surpreendentemente precisa a longa distância. Esta arma foi pintada usando pinturas transparentes com o uso de um aerógrafo, que se misturam sobre um revestimento cromado.',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
