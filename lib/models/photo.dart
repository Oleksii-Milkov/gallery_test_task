import 'package:gallery_test_task/models/urls.dart';
import 'package:gallery_test_task/models/user.dart';

class Photo {
  late String id;
  late int width;
  late int height;
  late String description;
  late Urls urls;
  late User user;

  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.description,
    required this.urls,
    required this.user,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    description = json['alt_description'] ?? json['alt_description'] ?? '';
    urls = Urls.fromJson(json['urls']);
    user = User.fromJson(json['user']);
  }
}
