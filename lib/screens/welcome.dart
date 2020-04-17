import 'package:flutter/material.dart';
import 'signup.dart';
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: constraints.maxWidth / 1.8,
                child: Text(
                  'Welcome to Twitch',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: constraints.maxWidth,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => true,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: constraints.maxWidth,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Color(0x0ffdededf),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    )
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
