import 'package:flutter/material.dart';
import 'package:ofspace/Screens/ProfileScreen/AddClipper.dart';

class NearByFriend extends StatelessWidget {
  final String name;
  final Color color;
  NearByFriend({this.name, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipPath(
        clipper: RoundClipper(),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/34465683?v=4",
                    ),
                    radius: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 38,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
