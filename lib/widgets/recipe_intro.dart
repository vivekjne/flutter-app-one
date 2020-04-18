import 'dart:io';

import 'package:flutter/material.dart';

class RecipeIntro extends StatelessWidget {
  String recipeName;
  String userName;
  String userImageUrl;
  int stepsNumber;
  String recipeImageUrl;
  Function onPhotoTapped;

  RecipeIntro(
      {this.recipeName,
      @required this.userName,
      this.userImageUrl,
      @required this.stepsNumber,
      this.recipeImageUrl,
      this.onPhotoTapped});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(userImageUrl),
                          child: userImageUrl == null
                              ? null
                              : Icon(
                                  Icons.account_circle,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                        ),
                        Text(
                          userName,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 30),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        recipeName,
                        style: TextStyle(
                            fontSize: constraints.maxWidth / 10,
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: constraints.maxHeight,
                            child: recipeImageUrl == null
                                ? GestureDetector(
                                    onTap: () {
                                      onPhotoTapped();
                                    },
                                    child: Container(
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
                                            onPressed: () {
                                              onPhotoTapped();
                                            },
                                          ),
                                        ),
                                      ),
                                    )),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      onPhotoTapped();
                                    },
                                    child: Image.file(
                                      File(recipeImageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                          top: -20,
                          left: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              '$stepsNumber STEPS',
                              style: Theme.of(context).textTheme.subhead,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
