import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x0ff9146fe),
      child: Center(
        child: Image(
          color: Colors.black,
          image: NetworkImage(
              'https://pngimg.com/uploads/twitch/twitch_PNG36.png'),
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
