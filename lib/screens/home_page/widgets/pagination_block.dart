import 'package:flutter/material.dart';
import 'package:gallery_test_task/providers/gallery_provider.dart';
import 'package:provider/provider.dart';

class PaginationBlock extends StatelessWidget {
  const PaginationBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryProvider>(
      builder: (context, galleryProvider, child) {
        return Row(
          children: [
            IconButton(
              onPressed: galleryProvider.currentPage > 1
                  ? () => galleryProvider.currentPage--
                  : null,
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            Center(
              child: Text('${galleryProvider.currentPage}'),
            ),
            IconButton(
              onPressed: () => galleryProvider.currentPage++,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
          ],
        );
      },
    );
  }
}
