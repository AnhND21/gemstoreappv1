import 'package:flutter/material.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router, // Sử dụng GoRouter
      theme:
          ThemeData(primarySwatch: Colors.blue, fontFamily: 'ProductSans'),
    );
  }
}
