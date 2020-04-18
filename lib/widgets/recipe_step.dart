import 'package:flutter/material.dart';

class RecipeStep extends StatelessWidget {
  String stepText;
  String stepImageUrl;

  int stepCount;
  int index;
  int stepIndex;

  RecipeStep(
      {this.stepText,
      this.stepImageUrl,
      @required this.stepCount,
      @required this.index,
      @required this.stepIndex});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(vertical: index == stepIndex ? 0 : 30),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 20,
                          color: Colors.black87)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: constraints.maxHeight,
                            child: stepImageUrl == null
                                ? Container(
                                    child: Material(
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: Ink(
                                        width: 50,
                                        height: 50,
                                        decoration: const ShapeDecoration(
                                          color: Colors.white,
                                          shape: CircleBorder(),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.camera_alt,
                                            size: 36,
                                          ),
                                          color: Colors.black45,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ))
                                : Image.network(stepImageUrl),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Positioned(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                  child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'Add your text...',
                                    border: InputBorder.none),
                                style: Theme.of(context).textTheme.display1,
                              )),
                            ),
                          ),
                          Positioned(
                            left: -10,
                            top: -constraints.maxHeight / 30,
                            child: Container(
                              width: constraints.maxWidth,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                stepCount.toString(),
                                style: Theme.of(context).textTheme.headline,
                              )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
