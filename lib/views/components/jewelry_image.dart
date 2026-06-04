import 'package:flutter/material.dart';

// shows asset OR network image (http) - used on shop, home, details
class JewelryImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;

  const JewelryImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (path.startsWith('http')) {
      return Image.network(path, width: width, height: height, fit: fit);
    }
    return Image.asset(path, width: width, height: height, fit: fit);
  }
}
