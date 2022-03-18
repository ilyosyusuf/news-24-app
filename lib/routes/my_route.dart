import 'package:flutter/material.dart';
class MyRoute{
  Route? onGenerateRoute(RouteSettings settings){
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(builder: (ctx)=>NewsPage());
    }
  }
}
