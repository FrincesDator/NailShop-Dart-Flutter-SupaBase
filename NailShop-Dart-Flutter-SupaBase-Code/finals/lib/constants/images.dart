import 'package:flutter/material.dart';
import 'package:finals/constants/fonts.dart';

class ImageContent extends StatelessWidget {
  ImageContent({required this.image, required this.label});

  final ImageProvider<Object> image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Image(
          image: image,
          height: 100.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
