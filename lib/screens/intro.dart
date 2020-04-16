import 'dart:async';

import 'package:flutter/material.dart';
import 'welcome.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Welcome(),
          ));
    });
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
