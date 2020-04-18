import "package:flutter/material.dart";
import 'package:flutter_twitch/screens/home.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text('Login'),
        backgroundColor: Color(0xffffffff),
        elevation: 0.0,
      ),
      body: SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      print(picked);
      dateController =
          TextEditingController(text: picked.toString().split(' ')[0]);
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // dateController = TextEditingController(text: 'DOB');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: constraints.maxWidth,
              child: Text(
                'SignUp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email Id is required';
                  }
                  return value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'User name is required';
                  }
                  return value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: new InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is required';
                  }
                  return value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: dateController,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _selectDate(context);
                },
                decoration: new InputDecoration(
                  labelText: 'Date of birth',
                  hintText: 'Date of birth',
                  suffixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey)),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is required';
                  }
                  return value;
                },
              ),
            ),
            Container(
              width: constraints.maxWidth,
              padding: EdgeInsets.all(15.0),
              child: RaisedButton(
                color: Color(0x0ff9146fe),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()))
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
