import 'package:flutter/material.dart';
import '../../widgets/recipe_intro.dart';
import '../../widgets/recipe_step.dart';
import '../camera.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  int _stepsNumber = 2;
  String _userName = 'username';
  String _recipeName = 'Name Your Recipe';
  String _recipeImageUrl;
  String _userImageUrl = '';
  int stepIndex = 0;
  void _onPhotoTapped() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CameraScreen()));
    setState(() {
      _recipeImageUrl = result;
    });
  }

  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Text(
                'Save',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Publish',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // Your widgets here
          ],
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        color: Colors.grey[200],
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              stepIndex = index;
            });
          },
          controller: _pageController,
          children: <Widget>[
            RecipeIntro(
                stepsNumber: _stepsNumber,
                userName: _userName,
                recipeName: _recipeName,
                recipeImageUrl: _recipeImageUrl,
                userImageUrl: _userImageUrl,
                onPhotoTapped: _onPhotoTapped),
            RecipeStep(
              stepCount: 1,
              index: 1,
              stepIndex: stepIndex,
            ),
            RecipeStep(
              stepCount: 2,
              index: 2,
              stepIndex: stepIndex,
            ),
          ],
        ),
        // padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
