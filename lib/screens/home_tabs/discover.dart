import 'package:flutter/material.dart';
import 'dart:math';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with SingleTickerProviderStateMixin {
  List backgroundColors = [
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.cyanAccent,
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.greenAccent
  ];
  int selectedIndex = -1;
  bool startAnim = false;
  var random = new Random();
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    animation = Tween<double>(begin: 0, end: 4).animate(controller)
      ..addListener(() {
        startAnim = true;
      });
    super.initState();
  }

  Color calculateIndex(index) {
    if (index % 6 == 0) {
      return backgroundColors[5];
    }

    if (index % 5 == 0) {
      return backgroundColors[4];
    }
    if (index % 4 == 0) {
      return backgroundColors[3];
    }
    if (index % 3 == 0) {
      return backgroundColors[2];
    }
    if (index % 2 == 0) {
      return backgroundColors[1];
    }

    return backgroundColors[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[300]),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.grey[500],
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Discover More'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 1.6,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: List.generate(100, (index) {
                return GestureDetector(
                  onTap: () {},
                  onTapDown: (TapDownDetails details) {
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.forward();
                  },
                  onTapUp: (TapUpDetails details) {
                    setState(() {
                      selectedIndex = -1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        selectedIndex == index ? animation.value : 0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: calculateIndex(index),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Text(
                                'Category $index',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              left: 8,
                              bottom: 4,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
