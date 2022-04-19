
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todosapp/screens/splash_page.dart';
import 'package:todosapp/screens/todos_page.dart';

class MyRoute{
  Route? onGenerateRoute(RouteSettings settings){
    var args = settings.arguments;
    
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: ((context) => ToDosPage()));
      case '/splash':
        return MaterialPageRoute(builder: ((context) => SplashPage()));
    }
  }
}