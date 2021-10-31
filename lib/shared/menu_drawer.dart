import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'SSConverter',
      'About',
    ];

    List<Widget> menuItems = [];
    menuItems.add(
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          'SS Converter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );

    for (var m in menuTitles) {
      menuItems.add(ListTile(
        title: Text(m, style: const TextStyle(fontSize: 18)),
        onTap: () {},
      ));
    }

    return menuItems;
  }
}
