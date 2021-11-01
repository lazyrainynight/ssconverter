import 'package:flutter/material.dart';
import 'package:ssconverter/shared/my_converter.dart';

// import 'package:ssconverter/shared/menu_bottom.dart';
// import 'package:ssconverter/shared/menu_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _convert() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      // drawer: const MenuDrawer(),
      // bottomNavigationBar: const MenuBottom(),
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('particles-1200.jpg'),
        //     // image: AssetImage('building.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Column(
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyConverter(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _convert,
        tooltip: 'Convert',
        child: const Icon(Icons.add),
      ),
    );
  }
}
