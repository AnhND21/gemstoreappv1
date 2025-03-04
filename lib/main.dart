import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
