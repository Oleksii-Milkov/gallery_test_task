import 'package:flutter/foundation.dart';
import 'package:gallery_test_task/models/photo.dart';
import 'package:gallery_test_task/providers/dio_client.dart';

class GalleryProvider extends ChangeNotifier {
  List<Photo> photosList = [];

  int _currentPage = 1;

  int get currentPage => _currentPage;

  set currentPage(int currentPage) {
    _currentPage = currentPage;
    getPhotos(currentPage);
    notifyListeners();
  }

  Future<void> getPhotos([int? page]) async {
    final response = await dioApi.photoEndpoints.getPhotos(page ?? currentPage);
    switch (response?.statusCode) {
      case 200:
        if (photosList.isNotEmpty) photosList.clear();
        for (var element in response!.data) {
          photosList.add(Photo.fromJson(element));
        }
        notifyListeners();
    }
  }
}

GalleryProvider galleryProvider = GalleryProvider();
