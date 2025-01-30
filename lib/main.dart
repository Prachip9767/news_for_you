import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'routes_and_pages/route_and_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News_for_you',
      theme: ThemeData(),
      getPages: NewsPages.routes,
      initialRoute: NewsPages.initial,
    );
  }
}