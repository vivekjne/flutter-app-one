import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

List backgroundColors = [
  Colors.blueAccent,
  Colors.amberAccent,
  Colors.cyanAccent,
  Colors.deepOrangeAccent,
  Colors.deepPurpleAccent,
  Colors.greenAccent
];
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

class _FeedState extends State<Feed> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Colors.grey[400]))),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.bookmark),
                      Text('RECIPEAPP'),
                      Icon(Icons.settings)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.grey[100],
                  height: 140,
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (index) {
                      return GestureDetector(
                        onLongPress: () {},
                        onTapCancel: () {
                          setState(() {
                            selectedIndex = -1;
                          });
                        },
                        onTapDown: (TapDownDetails details) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        onTapUp: (TapUpDetails details) {
                          setState(() {
                            selectedIndex = -1;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 160,
                          padding:
                              EdgeInsets.all(selectedIndex == index ? 8 : 0),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
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
                ),
                Container(
                  // padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Colors.grey[300]))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "What's New",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 20, right: 10),
                            children: List.generate(10, (index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                width: constraints.maxWidth / 1.8,
                                padding: EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Stack(
                                        overflow: Overflow.clip,
                                        children: <Widget>[
                                          Positioned(
                                              top: 20,
                                              height: 240,
                                              width: constraints.maxWidth / 1.9,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      'https://www.bbcgoodfood.com/sites/default/files/recipe_images/moroccan-fish-stew.jpg'),
                                                ),
                                              )),
                                          Positioned(
                                            left: 50,
                                            child: Text(
                                              'username',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Positioned(
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                  'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg'),
                                            ),
                                            top: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Moroccan Fish',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '4views . 23 steps',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              );
                            })),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
