import 'package:film_app/screens/library_screen.dart';
import 'package:film_app/screens/watchlist.dart';
import 'package:flutter/material.dart';

import '../model/movie.dart';

import '../widget/top_rated_list_item.dart';

import '../widget/horizontal_list_item.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  List<Widget> _list = <Widget>[
    BodyMovie(),
    LibraryScreen(),
    WatchList(),
  ];

  void _onTap(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D212B),
        centerTitle: true,
        title: Text(
          "Movies",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _list.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1D212B),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color(0xFF1D212B),
              icon: Icon(Icons.home),
              title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add_sharp), title: Text("Library")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              title: Text("Watchlist"))
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
        elevation: 0,
      ),
    );
  }
}

class BodyMovie extends StatefulWidget {
  const BodyMovie({Key key}) : super(key: key);

  @override
  _BodyMovieState createState() => _BodyMovieState();
}

class _BodyMovieState extends State<BodyMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'New Film Today',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (ctx, i) => HorizontalListItem(i),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    child: Text('View All'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRatedMovieList.length,
                itemBuilder: (ctx, i) => TopRatedListItem(i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
