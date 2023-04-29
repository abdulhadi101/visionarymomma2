
import 'package:flutter/material.dart';

class OnboardImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? width, height;
  const OnboardImage(this.image, {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      width: width,
        height: height,
        image,
        fit: BoxFit.cover,
      );
  }
}