import 'package:flutter/material.dart';
import 'screens/intro.dart';
import 'screens/welcome.dart';
import 'screens/home.dart';
import 'screens/samples/firebase_register.dart';

void main() => runApp(TwitchApp());

class TwitchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Twitch App',
        theme: ThemeData(primaryColor: Color(0x0ff9146fe)),
        home: FirebaseRegister());
    // Scaffold(body: Home()));
  }
}
