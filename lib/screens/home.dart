import 'package:flutter/material.dart';
import 'home_tabs/discover.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  static const TextStyle optionsStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0:Home',
      style: optionsStyle,
    ),
    Discover(),
    Text(
      'Index 2:Create',
      style: optionsStyle,
    ),
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
