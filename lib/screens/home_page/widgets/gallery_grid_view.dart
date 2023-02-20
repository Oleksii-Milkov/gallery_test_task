import 'package:flutter/material.dart';
import 'package:gallery_test_task/providers/gallery_provider.dart';
import 'package:gallery_test_task/screens/home_page/widgets/gallery_grid_tile.dart';
import 'package:provider/provider.dart';

class GalleryGridView extends StatelessWidget {
  const GalleryGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryProvider>(
      builder: (context, galleryProvider, child) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GalleryGridTile(index: index);
          },
          itemCount: galleryProvider.photosList.length,
        );
      },
    );
  }
}
