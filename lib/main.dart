import 'package:flutter/material.dart';
import 'package:ssconverter/screens/about_screen.dart';
import 'package:ssconverter/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool light = true;
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SS Converter',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'SS Converter'),
        '/about': (context) => const AboutScreen(),
      },
      initialRoute: '/',
    );
  }
}
