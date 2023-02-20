import 'package:flutter/material.dart';
import 'package:gallery_test_task/providers/dio_client.dart';
import 'package:gallery_test_task/providers/gallery_provider.dart';
import 'package:gallery_test_task/screens/home_page/widgets/gallery_grid_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void>? loadingState;

  @override
  void initState() {
    loadingState = context.read<DioApi>().init().whenComplete(
          () => context.read<GalleryProvider>().getPhotos(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: [
          Consumer<GalleryProvider>(builder: (context, galleryProvider, child) {
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
          })
        ],
      ),
      body: FutureBuilder(
        future: loadingState,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const GalleryGridView();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
