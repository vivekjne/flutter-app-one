import 'package:flutter/material.dart';
import '../../widgets/notification_item.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(
            children: List.generate(5, (index) {
          return NotificationItem(
            title: 'Two-line ListTile',
            subtitle: 'Here is a second line',
            color: index % 2 == 0 ? Colors.red : Colors.green,
          );
        }));
      }),
    );
  }
}
