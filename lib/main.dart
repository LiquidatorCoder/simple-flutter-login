import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:yehlo/screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplash(
        imagePath: 'assets/Yeh!o.png',
          duration: 2500,
          home: LoginPage()),
    );
  }
}
