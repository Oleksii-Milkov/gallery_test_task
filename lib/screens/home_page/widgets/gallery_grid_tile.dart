import 'package:flutter/material.dart';
import 'package:gallery_test_task/providers/gallery_provider.dart';
import 'package:gallery_test_task/screens/photo_page/photo_page.dart';
import 'package:provider/provider.dart';

class GalleryGridTile extends StatelessWidget {
  const GalleryGridTile({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryProvider>(
      builder: (context, galleryProvider, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PhotoPage(
                  photo: galleryProvider.photosList[index],
                ),
              ),
            );
          },
          child: Hero(
            tag: galleryProvider.photosList[index].id,
            child: Card(
              child: Image.network(
                galleryProvider.photosList[index].urls.small,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
