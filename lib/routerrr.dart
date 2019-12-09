import 'package:flutter/cupertino.dart';
import 'package:movie_db/detailscreen.dart';
import 'package:movie_db/homescreen.dart';
import 'package:flutter/material.dart';

import 'pagesss.dart';

class Router{
  Route<dynamic> getRoute(settings){
    Map<String,dynamic> arguments=settings.arguments;

    switch(settings.name){
      case Pages.Home:
        return _buildRoute(settings, HomeScreen());
      case Pages.Detail:
        return _buildRoute(settings, DetailScreen(
          film: arguments['detailscreen']));

          default:
        return null;
    }
    
  }
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder){
  return MaterialPageRoute(
    builder: (ctx) => builder,
    settings: settings,
  );
}