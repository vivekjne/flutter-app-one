import 'package:flutter/material.dart';
import '../story_view/story_view.dart';

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: StoryView(
                  [
                    StoryItem.pageImage(
                      NetworkImage(
                          "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg"),
                      color: Theme.of(context).primaryColor,
                      stepCount: 1,
                      stepIndex: 1,
                      stepText: 'Prepare the fish',
                    ),
                    StoryItem.pageImage(
                      NetworkImage(
                          "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg"),
                      color: Theme.of(context).primaryColor,
                      stepCount: 2,
                      stepIndex: 2,
                      stepText: 'Pour Water',
                    ),
                    StoryItem.pageImage(
                      NetworkImage(
                          "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg"),
                      color: Theme.of(context).primaryColor,
                      stepCount: 3,
                      stepIndex: 3,
                      stepText: 'Cook for 30 minutes',
                    ),
                  ],
                  onStoryShow: (s) {
                    print("Showing a story");
                  },
                  onComplete: () {
                    print("Completed a cycle");
                  },
                  progressPosition: ProgressPosition.top,
                  repeat: false,
                  inline: true,
                ),
              ),
              // Material(
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.of(context).push(
              //           MaterialPageRoute(builder: (context) => MoreStories()));
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //           color: Colors.black54,
              //           borderRadius:
              //               BorderRadius.vertical(bottom: Radius.circular(8))),
              //       padding: EdgeInsets.symmetric(vertical: 8),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Icon(
              //             Icons.arrow_forward,
              //             color: Colors.white,
              //           ),
              //           SizedBox(
              //             width: 16,
              //           ),
              //           Text(
              //             "View more stories",
              //             style: TextStyle(fontSize: 16, color: Colors.white),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: StoryView(
        [
          StoryItem.text(
            "I guess you'd love to see more of our food. That's great.",
            Colors.blue,
          ),
          StoryItem.text(
            "Nice!\n\nTap to continue.",
            Colors.red,
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg"),
            caption: "Still sampling",
          ),
          StoryItem.pageGif(
              "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageGif(
            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageGif(
            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
