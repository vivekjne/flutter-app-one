import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text('Login'),
        backgroundColor: Color(0xffffffff),
        elevation: 0.0,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: constraints.maxWidth / 1.8,
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: 1,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: 'John Doe',
                      filled: true,
                      fillColor: Color(0xFcccccc),
                      suffixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0x0ff9146fe)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: 1,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: '*********',
                      filled: true,
                      fillColor: Color(0xFffffff),
                      suffixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0x0ff9146fe))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                width: constraints.maxWidth,
                padding: const EdgeInsets.all(15.0),
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
              Container(
                width: constraints.maxWidth,
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Don't have an account SignUp!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
