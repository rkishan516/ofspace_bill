import 'package:flutter/material.dart';

class RoundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height-20);
    path.lineTo(size.width/2-12, size.height-20);
    path.arcToPoint(Offset(size.width/2+12,size.height-20),radius: Radius.circular(12),clockwise: false);
    path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(RoundClipper oldClipper) => false;
}