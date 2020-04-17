import 'dart:async';
import 'package:flutter/material.dart';
import 'welcome.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Welcome()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
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
