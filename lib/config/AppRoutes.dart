import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/login/Login.dart';
import 'package:flutter_blog/screens/posts/Post.dart';
import 'package:flutter_blog/screens/posts/Posts.dart';
import 'package:flutter_blog/screens/register/register.dart';
import 'package:flutter_blog/screens/splash/Splash.dart';

class AppRoutes{

  static const splashScreen = "/splash";

  static const login = "/login";
  static const posts = "/posts";
  static const post = "/post";
  static const register = "/register";

  static Route<dynamic> routes(RouteSettings settings){
    switch(settings.name){
	  case splashScreen: return MaterialPageRoute(settings: RouteSettings(name: settings.name, arguments: settings.arguments), builder: (context) => Splash());break;
	  case login: return MaterialPageRoute(settings: RouteSettings(name: settings.name, arguments: settings.arguments), builder: (context) => Login());break;
	  case posts: return MaterialPageRoute(settings: RouteSettings(name: settings.name, arguments: settings.arguments), builder: (context) => Posts());break;
	  case post: return MaterialPageRoute(settings: RouteSettings(name: settings.name, arguments: settings.arguments), builder: (context) => Post());break;
	  case register: return MaterialPageRoute(settings: RouteSettings(name: settings.name, arguments: settings.arguments), builder: (context) => Register());break;
	}
  }
}