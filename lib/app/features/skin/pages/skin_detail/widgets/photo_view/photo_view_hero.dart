// import 'package:cs2_info/app/application/ui/helpers/size_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';

// class PhotoViewHero extends StatelessWidget {
//   final ImageProvider imageProvider;
//   final BoxDecoration? backgroundDecoration;
//   final dynamic minScale;
//   final dynamic maxScale;
//   final String tag;

//   const PhotoViewHero({
//     super.key,
//     required this.imageProvider,
//     this.backgroundDecoration,
//     this.minScale,
//     this.maxScale,
//     required this.tag,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SizedBox(
//         height: 200,
//         child: PhotoView(
//           imageProvider: imageProvider,
//           backgroundDecoration: backgroundDecoration,
//           minScale: minScale,
//           maxScale: maxScale,
//           heroAttributes: PhotoViewHeroAttributes(tag: tag),
//         ),
//       ),
//     );
//   }
// }
