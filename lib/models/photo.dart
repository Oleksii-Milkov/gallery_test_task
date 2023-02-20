import 'package:gallery_test_task/models/urls.dart';

class Photo {
  late String id;
  late int width;
  late int height;
  late Urls urls;

  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.urls,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    urls = Urls.fromJson(json['urls']);
  }
}