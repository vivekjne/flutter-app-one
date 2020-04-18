import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  Color color;
  String title;
  String subtitle;

  NotificationItem({@required this.title, @required this.subtitle, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg'),
        ),
        title: Text('Two-line ListTile'),
        subtitle: Text('Here is a second line'),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color == null ? Colors.transparent : color),
        ),
      ),
    );
  }
}
