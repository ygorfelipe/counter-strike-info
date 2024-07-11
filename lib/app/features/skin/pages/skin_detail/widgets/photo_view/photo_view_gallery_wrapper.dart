import 'package:cs2_info/app/models/skin/skin_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewGalleryWrapper extends StatefulWidget {
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final List<SkinModel> skinModel;
  final Axis scrollDirection;
  final PageController pageController;

  PhotoViewGalleryWrapper({
    super.key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.skinModel,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  @override
  State<PhotoViewGalleryWrapper> createState() =>
      _PhotoViewGalleryWrapperState();
}

class _PhotoViewGalleryWrapperState extends State<PhotoViewGalleryWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: _buildItem,
            itemCount: widget.skinModel.length,
            loadingBuilder: widget.loadingBuilder,
            backgroundDecoration: widget.backgroundDecoration,
            pageController: widget.pageController,
            onPageChanged: onPageChanged,
            scrollDirection: widget.scrollDirection,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Image ${currentIndex + 1}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final SkinModel skin = widget.skinModel[index];
    return skin.crates!.isNotEmpty
        ? PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              '${skin.crates![index].image}',
            ),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.contained * 4.1,
            heroAttributes:
                PhotoViewHeroAttributes(tag: '${skin.crates![index].id}'),
          )
        : PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage('${skin.collections![index].image}'),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.contained * 4.1,
            heroAttributes:
                PhotoViewHeroAttributes(tag: '${skin.collections![index].id}'),
          );
  }
}
