import 'package:film_app/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';

import './screens/dashboard_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DashboardScreen(),
      routes: {
        MovieDetailsScreen.routeName: (ctx) => MovieDetailsScreen(),
      },
    );
  }
}
