import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/login/components/body_component.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyComponent(),
    );
  }
}
