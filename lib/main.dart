import 'package:flutter/material.dart';

import 'package:movie_db/routerrr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Movie DB" ,
    initialRoute: '/',
    onGenerateRoute: Router().getRoute,
    // home: Scaffold(
    //   body: HomeScreen(),
    // ),
    );
  }
}