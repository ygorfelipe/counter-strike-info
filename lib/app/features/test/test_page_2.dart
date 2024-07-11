import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../application/ui/styles/colors_app.dart';

class TestPage2 extends StatefulWidget {
  final String image;
  final String title;
  const TestPage2({super.key, required this.image, required this.title});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  bool _largePhoto = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 2'),
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          reverse: !_largePhoto,
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
          child: _largePhoto
              ? GestureDetector(
                  onTap: () => setState(() => _largePhoto = !_largePhoto),
                  child: Container(
                    color: ColorsApp.i.dark,
                    child: Image.network(
                      widget.image,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  color: ColorsApp.i.dark,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              setState(() => _largePhoto = !_largePhoto),
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(widget.title),
                        const SizedBox(height: 20.0),
                        const Text('_loremIpsumParagraph'),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
