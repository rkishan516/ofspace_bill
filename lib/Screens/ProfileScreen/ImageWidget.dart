import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final double top, left, radius;
  const ImageWidget({
    Key key,
    this.left,
    this.top,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://avatars.githubusercontent.com/u/34465683?v=4",
        ),
        radius: radius,
      ),
    );
  }
}