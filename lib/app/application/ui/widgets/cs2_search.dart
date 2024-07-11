import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CS2Search extends StatefulWidget {
  final VoidCallback? onClearPressed;
  final ValueChanged<String>? valueChanged;
  final ValueChanged<String>? onSelected;
  final bool visilibity;
  final TextEditingController? controller;

  final FocusNode? focusNode;
  const CS2Search({
    super.key,
    this.onClearPressed,
    this.valueChanged,
    this.controller,
    this.visilibity = false,
    this.focusNode,
    this.onSelected,
  });

  @override
  State<CS2Search> createState() => _CS2SearchState();
}

class _CS2SearchState extends State<CS2Search> {
  @override
  void initState() {
    widget.controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checkTypeValid = ValueNotifier<bool>(true);

    return SafeArea(
      child: ValueListenableBuilder(
          valueListenable: checkTypeValid,
          builder: (_, checkValid, child) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                onChanged: widget.valueChanged,
                controller: widget.controller,
                focusNode: widget.focusNode,
                style: const TextStyle(color: Colors.white),
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  suffixIcon: widget.controller!.text.isEmpty
                      ? PopupMenuButton<String>(
                          icon: const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          ),
                          onSelected: widget.onSelected,
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem<String>(
                                value: 'a-z',
                                child: Text('a-Z'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'z-a',
                                child: Text('z-A'),
                              ),
                            ];
                          },
                        )
                      : IconButton(
                          onPressed: widget.onClearPressed,
                          icon: Icon(
                            Icons.close_outlined,
                            size: context.percentHeight(.02),
                            color: Colors.white,
                          ),
                        ),
                  hintText: 'Search',
                  hintStyle: context.textStyles.textRegular
                      .copyWith(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    size: context.percentHeight(.02),
                    color: Colors.white,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

// Visibility _oldTextForm(ValueNotifier<bool> checkTypeValid, double sizeIcon) {
  //   return Visibility(
  //     visible: visilibity,
  //     replacement: filterWidget ?? const SizedBox.shrink(),
  //     child: ValueListenableBuilder(
  //         valueListenable: checkTypeValid,
  //         builder: (_, checkValid, child) {
  //           return Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.only(right: 12),
  //               child: TextField(
  //                 onChanged: valueChanged,
  //                 controller: controller,
  //                 decoration: InputDecoration(
  //                   suffix: controller!.text.isEmpty
  //                       ? InkWell(
  //                           onTap: onClearPressed,
  //                           child: const Icon(
  //                             Icons.more_vert_outlined,
  //                            size: context.percentHeight(.02),
  //                           ),
  //                         )
  //                       : InkWell(
  //                           onTap: onClearPressed,
  //                           child: const Icon(
  //                             Icons.close_outlined,
  //                           size: context.percentHeight(.02),
  //                           ),
  //                         ),
  //                   label: const Text(
  //                     'Buscar',
  //                     textAlign: TextAlign.right,
  //                   ),
  //                   hintText: 'Buscar',
  //                   prefix: const Icon(
  //                     Icons.search,
  //                     size: sizeIcon,
  //                   ),
  //                   border: const OutlineInputBorder(
  //                     borderRadius: BorderRadius.all(
  //                       Radius.circular(10.0),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         }),
  //   );
  // }

