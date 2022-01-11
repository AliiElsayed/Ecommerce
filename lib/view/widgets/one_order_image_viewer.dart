import 'package:flutter/material.dart';

class OneImageViewer extends StatelessWidget {
  final String imagesUrl;
  final double imageHeight;
  final double imageWidth;
  OneImageViewer({this.imagesUrl, this.imageHeight, this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      width: imageWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.network(
          imagesUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
