import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({ Key? key }) : super(key: key);

  final imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Jakarta_Skyline_Part_2.jpg/1200px-Jakarta_Skyline_Part_2.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CACHED NETWORK IMAGE'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          cacheManager: CacheManager(
            Config(
              'customCacheKey',
              stalePeriod: const Duration(days: 7)
            )
          ),
          errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 100,
              color: Colors.red,
           ),
          imageBuilder: (context, imageProvider) => Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),          
        ),
      ),
    );
  }
  
  void _deleteCachedImage() {
    CachedNetworkImage.evictFromCache(imageUrl);
  }
}