import 'package:flutter/material.dart';
import 'package:flutter_twitch/screens/home_tabs/feed.dart';
import 'home_tabs/discover.dart';
import 'home_tabs/notification.dart';
import 'home_tabs/create.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  static const TextStyle optionsStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    Feed(),
    Discover(),
    Create(),
    Notifications(),
    Text(
      'Index 3:Notifications',
      style: optionsStyle,
    ),
    Text(
      'Index 4:My Account',
      style: optionsStyle,
    ),
  ];

  void _onItemTapped(int index) {
    // if(index==2){
    //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>))
    // }
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('')),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey[500],
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
