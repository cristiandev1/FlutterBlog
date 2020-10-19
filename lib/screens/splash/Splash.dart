import 'package:flutter/material.dart';
import 'package:flutter_blog/config/AppRoutes.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
	Future.delayed(Duration(seconds: 2),(){
	  Navigator.of(context).pushReplacementNamed(AppRoutes.login);
	});

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
