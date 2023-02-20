import 'package:flutter/material.dart';
import 'package:gallery_test_task/models/photo.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key, required this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Hero(
          tag: photo.id,
          child: Image.network(
            photo.urls.small,
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
