import 'package:flutter/material.dart';
import 'editaccount.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return new AccountSettingsForm();
    });
  }
}

class AccountSettingsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Accounts',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: new Column(
            children: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditAccount())),
                child: new Hero(
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      final Hero toHero = toHeroContext.widget;
                      return new CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: new NetworkImage(
                            'https://www.johnwick.movie/media/images/home/bg.jpg'),
                      );
                    },
                    tag: 'editUser',
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: new CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 55,
                            child: new CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              backgroundImage: new NetworkImage(
                                  'https://www.johnwick.movie/media/images/home/bg.jpg'),
                            ),
                          ),
                        ),
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: new Text(
                                'John Wick',
                                style: new TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            new Container(
                              width: 250,
                              child: new Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: new Text(
                                  'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                                  style: new TextStyle(fontSize: 16),
                                  maxLines: 5,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
              new AccountTabs()
            ],
          ),
        ),
      ),
    );
  }
}

class AccountTabs extends StatefulWidget {
  @override
  _AccountTabsState createState() => _AccountTabsState();
}

class _AccountTabsState extends State<AccountTabs>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Container(
          child: new TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Colors.black,
            controller: _controller,
            tabs: [
              new Tab(
                text: 'My Posts',
              ),
              new Tab(
                text: 'Saved',
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              GridView.count(
                childAspectRatio: 3 / 2,
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 3,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    height: 30,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(
                                'https://casasensei.com/wp-content/uploads/2019/06/South-Indian-Bruschetta-Recipe.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  new Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    height: 30,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(
                                'https://static01.nyt.com/images/2020/03/03/well/physed-foods/physed-foods-mediumSquareAt3X.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  new Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    height: 30,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(
                                'https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/chorizo-mozarella-gnocchi-bake-cropped.jpg'),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
              Container(
                height: 400,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                      height: 30,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(
                                  'https://casasensei.com/wp-content/uploads/2019/06/South-Indian-Bruschetta-Recipe.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    new Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                      height: 30,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(
                                  'https://casasensei.com/wp-content/uploads/2019/06/South-Indian-Bruschetta-Recipe.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    new Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                      height: 30,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(
                                  'https://casasensei.com/wp-content/uploads/2019/06/South-Indian-Bruschetta-Recipe.jpg'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
