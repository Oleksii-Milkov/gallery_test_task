import 'package:flutter/material.dart';
import 'package:gallery_test_task/providers/dio_client.dart';
import 'package:gallery_test_task/providers/gallery_provider.dart';
import 'package:gallery_test_task/screens/home_page/widgets/gallery_grid_view.dart';
import 'package:gallery_test_task/screens/home_page/widgets/pagination_block.dart';
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
        actions: const [
          PaginationBlock(),
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
