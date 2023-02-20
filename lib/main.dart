import 'package:flutter/material.dart';
import 'package:gallery_test_task/providers.dart';
import 'package:gallery_test_task/screens/home_page/home_page.dart';

void main() {
  runApp(
    const Providers(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cardTheme: CardTheme(
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
