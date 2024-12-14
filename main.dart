import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clubhouse UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: kBackgroundColor),
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, secondary: kSecondaryColorGreen),
        iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: 'montserrat',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'montserrat',
          ),
          bodyMedium: TextStyle(
            fontFamily: 'montserrat',
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
