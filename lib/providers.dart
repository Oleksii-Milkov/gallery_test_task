import 'package:flutter/material.dart';
import 'package:gallery_test_task/providers/dio_client.dart';
import 'package:gallery_test_task/providers/gallery_provider.dart';
import 'package:provider/provider.dart';

class Providers extends StatelessWidget {
  const Providers({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => dioApi,
        ),
        ChangeNotifierProvider(
          create: (_) => galleryProvider,
        )
      ],
      child: child,
    );
  }
}
