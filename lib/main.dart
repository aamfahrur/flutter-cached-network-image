import 'package:flutter/material.dart';
import 'package:flutter_cached_network_image/cache_image.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CacheImage()
    );
  }
}
