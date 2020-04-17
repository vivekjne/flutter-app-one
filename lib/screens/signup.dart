import "package:flutter/material.dart";
import 'package:flutter_twitch/screens/home.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Email Id',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TextFormField(
              style: TextStyle(height: 1, fontSize: 20),
              decoration: new InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
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
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'User Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TextFormField(
              style: TextStyle(height: 1, fontSize: 20),
              decoration: new InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
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
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TextFormField(
              autofocus: false,
              obscureText: true,
              style: TextStyle(height: 1, fontSize: 20),
              decoration: new InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
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
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Date of Birth',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: TextFormField(
              controller: dateController,
              style: TextStyle(height: 1, fontSize: 20),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                _selectDate(context);
              },
              decoration: new InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
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
          Container(
            width: constraints.maxWidth,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: RaisedButton(
              color: Color(0x0ff9146fe),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
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
      );
    });
  }
}
