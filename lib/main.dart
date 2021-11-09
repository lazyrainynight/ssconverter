import 'package:flutter/material.dart';
import 'package:ssconverter/screens/about_screen.dart';
import 'package:ssconverter/screens/my_home_page.dart';
import 'package:ssconverter/shared/SystemConsts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bool light = true;
  final bool dark = false;

  final Color cursorColor = Colors.amberAccent;
  final Color selectionColor = Colors.deepOrangeAccent;
  final Color selectionHandleColor = Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SS Converter v${SystemConsts.version}',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: cursorColor,
          selectionColor: selectionColor,
          selectionHandleColor: selectionHandleColor,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 24),
          bodyText2: TextStyle(fontSize: 22),
        ),
        // colorScheme: ColorScheme(
        //   primary: Colors.blueGrey,
        //   primaryVariant: Colors.amber,
        //   secondary: Colors.orange,
        //   secondaryVariant: Colors.amber,
        //   surface: Colors.grey,
        //   background: Colors.grey,
        //   error: Colors.deepOrange,
        //   onPrimary: Colors.amber,
        //   onSecondary: Colors.orange,
        //   onSurface: Colors.orange,
        //   onBackground: Colors.white,
        //   onError: Colors.red,
        //   brightness: Brightness.dark,
        // ),
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'SS Converter'),
        '/about': (context) => const AboutScreen(),
      },
      initialRoute: '/',
    );
  }
}
