import 'package:flutter/material.dart';
import 'editaccount.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountsDetails();
    // return MainCollapsingToolbar();
  }
}
 
class AccountsDetails extends StatefulWidget {
  @override
  _AccountsDetailsState createState() => _AccountsDetailsState();
}

class _AccountsDetailsState extends State<AccountsDetails> with SingleTickerProviderStateMixin
{

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
          expandedHeight: 250.00,
          floating: false,
          pinned: true,
          flexibleSpace: new FlexibleSpaceBar(
            centerTitle: true,
            title: new Text('John Wick',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            background: new GestureDetector(
              behavior: HitTestBehavior.translucent,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                    child: new CircleAvatar(
                      backgroundColor: Colors.white10,
                      radius: 55,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: new CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.white,
                          backgroundImage: new NetworkImage(
                            'https://www.johnwick.movie/media/images/home/bg.jpg'
                          ),
                        ),
                      ),
                    ),
                  ),
                tag: 'editUser',
              )
            )
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyTabBarDelegate(
            child: TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Colors.black87,
              labelStyle: TextStyle(
                backgroundColor: Colors.white
              ),
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(text: 'My Posts'),
                Tab(text: 'Saved'),
              ],
            ),
          )
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: this._tabController,
            children: <Widget>[
              GridView.count(
                crossAxisCount: 3,
                children: List.generate(10, (index){
                  return new Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: new NetworkImage(
                            'https://www.diabetes.org/sites/default/files/styles/full_width/public/2019-06/Healthy%20Food%20Made%20Easy%20-min.jpg'),
                        fit: BoxFit.fill,
                      ),
                    )
                  );
                }),
              ),
              GridView.count(
                crossAxisCount: 3,
                children: List.generate(10, (index){
                  return new Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: new NetworkImage(
                            'https://i.ndtvimg.com/i/2016-06/chinese-625_625x350_81466064119.jpg'),
                        fit: BoxFit.fill,
                      ),
                    )
                  );
                }),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

// class MainCollapsingToolbar extends StatefulWidget {
//   @override
//   _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
// }

// class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTabController(
//         length: 2,
//         child: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return <Widget>[
//               SliverAppBar(
//                 iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
//                 backgroundColor: Colors.white,
//                 expandedHeight: 200.0,
//                 floating: false,
//                 pinned: true,
//                 flexibleSpace: FlexibleSpaceBar(
//                     centerTitle: true,
//                     title: Text("John Wick",
//                         style: TextStyle(
//                           color: Theme.of(context).primaryColor,
//                           fontSize: 16.0,
//                         )),
//                     background: Image.network(
//                       "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
//                       fit: BoxFit.cover,
//                     )),
//               ),
//               SliverPersistentHeader(
//                 delegate: _SliverAppBarDelegate(
//                   TabBar(
//                     indicatorColor: Theme.of(context).primaryColor,
//                     labelColor: Colors.black87,
//                     unselectedLabelColor: Colors.grey,
//                     tabs: [
//                       Tab( text: "My Posts"),
//                       Tab( text: "Saved"),
//                     ],
//                   ),
//                 ),
//                 pinned: true,
//               ),
//             ];
//           },
//           body: Center(
//             child: Text("Sample text"),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new Container(
//       child: _tabBar,
//     );
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }