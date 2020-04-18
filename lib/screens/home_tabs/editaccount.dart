import 'package:flutter/material.dart';

class EditAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return new ListView(
              children: <Widget>[
                new Hero(
                  tag: 'editUser', 
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://www.johnwick.movie/media/images/home/bg.jpg"),
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: 'Name',
                      hintText: 'John Wick',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: const OutlineInputBorder(),
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  child: new TextFormField(
                    maxLines: 5,
                    decoration: new InputDecoration(
                      labelText: 'Desciption',
                      hintText: 'Description',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: const OutlineInputBorder(),
                    )
                  ),
                )
              ],
            );
          }
        )
    );
  }
}