import 'package:flutter/material.dart';
import 'package:flutter_blog/Injectos.dart';
import 'package:get/route_manager.dart';
import 'config/AppRoutes.dart';
import 'dart:io';

void main() {
  Injectors.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
