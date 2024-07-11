import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/widgets/cs2_app_bar.dart';
import 'package:cs2_info/app/features/skin/pages/skin_detail/widgets/collections_info.dart';
import 'package:cs2_info/app/features/skin/pages/skin_detail/widgets/crates_info.dart';
import 'package:cs2_info/app/features/skin/pages/skin_detail/widgets/skin_info.dart';
import 'package:cs2_info/app/models/skin/skin_model.dart';
import 'package:flutter/material.dart';

import '../../../../application/ui/styles/colors_app.dart';
import '../../../../application/ui/widgets/image_preview.dart';

class SkinDetailPage extends StatefulWidget {
  final SkinModel skin;

  const SkinDetailPage({super.key, required this.skin});

  @override
  State<SkinDetailPage> createState() => _SkinDetailPageState();
}

class _SkinDetailPageState extends State<SkinDetailPage> {
  List<String> pageView = ['Info', 'Crates', 'Collections'];

  // void _nextPage(Widget page) {
  //   Navigator.push(
  //     context,
  //     PageRouteBuilder(
  //       transitionDuration: const Duration(milliseconds: 200),
  //       pageBuilder: (context, animation, secondaryAnimation) {
  //         return page;
  //       },
  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //         return Align(
  //           child: FadeTransition(
  //             opacity: animation,
  //             child: child,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  int defaultTabLength() {
    return widget.skin.collections!.isEmpty || widget.skin.crates!.isEmpty
        ? 2
        : 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CS2AppBar(),
      body: Column(
        children: [
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.white,
          //     ),
          //     Icon(
          //       Icons.arrow_forward_ios_rounded,
          //       color: Colors.white,
          //     ),
          //   ],
          // ),
          Expanded(
            child: InkWell(
              onTap: () => ImagePreview.showPreview(
                context,
                imageUrl: '${widget.skin.image}',
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsApp.i.dark,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.skin.image ?? '',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: context.percentHeight(0.5),
                decoration: BoxDecoration(
                  color: ColorsApp.i.backgroundColor,
                ),
                child: DefaultTabController(
                  length: defaultTabLength(),
                  child: _content(context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _content(BuildContext context) {
    final highBox = context.percentHeight(.05);
    if (widget.skin.crates!.isEmpty) {
      return Column(
        children: [
          TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  '${widget.skin.image}',
                  height: highBox,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  '${widget.skin.collections?.first.image}',
                  height: highBox,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                SkinInfo(skin: widget.skin),
                CollectionsInfo(skin: widget.skin),
              ],
            ),
          )
        ],
      );
    } else if (widget.skin.collections!.isEmpty) {
      return Column(
        children: [
          TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  '${widget.skin.image}',
                  height: highBox,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  '${widget.skin.crates?.first.image}',
                  height: highBox,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                SkinInfo(skin: widget.skin),
                CratesInfo(skin: widget.skin),
              ],
            ),
          )
        ],
      );
    }
    return Column(
      children: [
        TabBar(
          tabs: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                '${widget.skin.image}',
                height: highBox,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                '${widget.skin.crates?.first.image}',
                height: highBox,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                '${widget.skin.collections?.first.image}',
                height: highBox,
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              SkinInfo(skin: widget.skin),
              CratesInfo(skin: widget.skin),
              CollectionsInfo(skin: widget.skin),
            ],
          ),
        )
      ],
    );
  }
}
