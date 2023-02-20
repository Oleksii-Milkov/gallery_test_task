import 'package:flutter/material.dart';
import 'package:gallery_test_task/models/photo.dart';
import 'package:gallery_test_task/utils/string_extension.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Center(
            child: Hero(
              tag: photo.id,
              child: Image.network(
                photo.urls.small,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Material(
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.user.name ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Row(
                    children: const [SizedBox(height: 12)],
                  ),
                  Text(
                    photo.description?.capitalize() ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
