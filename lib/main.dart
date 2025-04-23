import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppe/routes/app_routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shoppe',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
     initialRoute: AppRoutes.startScreen,
     getPages: AppRoutes.pages,
    );
  }
}
