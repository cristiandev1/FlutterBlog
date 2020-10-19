import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/login/Login.dart';
import 'package:flutter_blog/screens/splash/Splash.dart';

class AppRoutes{

  static const splashScreen = "/splash";

  static const login = "/login";

  static Route<dynamic> routes(RouteSettings settings){
    switch(settings.name){
	  case splashScreen: return MaterialPageRoute(settings: RouteSettings(name: settings.name, arguments: settings.arguments), builder: (context) => Splash());break;
	  case login: return MaterialPageRoute(settings: RouteSettings(name: settings.name, arguments: settings.arguments), builder: (context) => Login());break;
	}
  }
}