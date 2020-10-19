import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'config/AppRoutes.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
