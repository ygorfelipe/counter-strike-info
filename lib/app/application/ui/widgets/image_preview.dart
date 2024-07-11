import 'package:cs2_info/app/application/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

sealed class ImagePreview {
  static void showPreview(BuildContext context,
      {String? name, required String imageUrl}) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black87,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      imageUrl,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      name ?? '',
                      style: context.textStyles.textTile.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white10,
                      child: IconButton(
                        onPressed: () {
                          if (overlayEntry?.mounted ?? false) {
                            overlayEntry?.remove();
                          }
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
  }
}
