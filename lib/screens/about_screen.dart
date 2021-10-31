import 'package:flutter/material.dart';
import 'package:ssconverter/shared/menu_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SS Converter')),
      drawer: const MenuDrawer(),
      body: const Center(child: Text('ABOUT PAGE')),
    );
  }
}
